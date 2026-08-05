-- ============================================================================
-- WAANOFI POULTRY & EGG PRODUCTION MANAGEMENT MIGRATION
-- Migration Date: 2026-08-07
-- Description: Extends farm types, adds flocks, egg production records, and
--              auditable flock population adjustments with RLS isolation.
-- ============================================================================

-- ────────────────────────────────────────────────────────────────────────────
-- 1. Farm Type Extension
-- ────────────────────────────────────────────────────────────────────────────
CREATE TYPE public.farm_type AS ENUM ('dairy', 'poultry', 'mixed');

ALTER TABLE public.farms 
  ADD COLUMN IF NOT EXISTS farm_type public.farm_type NOT NULL DEFAULT 'dairy';

-- ────────────────────────────────────────────────────────────────────────────
-- 2. Flocks Table (Flock-level Poultry Tracking)
-- ────────────────────────────────────────────────────────────────────────────
CREATE TYPE public.flock_purpose AS ENUM ('layers', 'broilers', 'dual');
CREATE TYPE public.flock_status AS ENUM ('active', 'inactive', 'sold', 'completed', 'quarantined');

CREATE TABLE IF NOT EXISTS public.flocks (
  id                   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id              UUID NOT NULL REFERENCES public.farms (id) ON DELETE CASCADE,
  flock_code           TEXT NOT NULL,
  name                 TEXT NOT NULL,
  breed                TEXT NOT NULL,
  purpose              public.flock_purpose NOT NULL DEFAULT 'layers',
  number_of_birds      INT NOT NULL DEFAULT 0 CHECK (number_of_birds >= 0),
  number_of_laying_hens INT NOT NULL DEFAULT 0 CHECK (number_of_laying_hens >= 0 AND number_of_laying_hens <= number_of_birds),
  arrival_date         DATE NOT NULL DEFAULT CURRENT_DATE,
  hatch_date           DATE NULL,
  housing_type         TEXT NULL,
  source               TEXT NULL,
  status               public.flock_status NOT NULL DEFAULT 'active',
  notes                TEXT NULL,
  created_by           UUID NULL REFERENCES auth.users (id) ON DELETE SET NULL,
  created_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at           TIMESTAMPTZ NULL,

  CONSTRAINT uq_flocks_farm_code UNIQUE (farm_id, flock_code)
);

CREATE INDEX IF NOT EXISTS idx_flocks_farm_status ON public.flocks (farm_id, status);
CREATE TRIGGER trg_flocks_updated_at
  BEFORE UPDATE ON public.flocks
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();

-- ────────────────────────────────────────────────────────────────────────────
-- 3. Egg Production Records Table
-- ────────────────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.egg_production_records (
  id                 UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id            UUID NOT NULL REFERENCES public.farms (id) ON DELETE CASCADE,
  flock_id           UUID NOT NULL REFERENCES public.flocks (id) ON DELETE RESTRICT,
  production_date    DATE NOT NULL DEFAULT CURRENT_DATE,
  good_eggs          INT NOT NULL DEFAULT 0 CHECK (good_eggs >= 0),
  cracked_eggs       INT NOT NULL DEFAULT 0 CHECK (cracked_eggs >= 0),
  rejected_eggs      INT NOT NULL DEFAULT 0 CHECK (rejected_eggs >= 0),
  farm_use_eggs      INT NOT NULL DEFAULT 0 CHECK (farm_use_eggs >= 0),
  sold_directly_eggs INT NOT NULL DEFAULT 0 CHECK (sold_directly_eggs >= 0),
  available_eggs     INT NOT NULL DEFAULT 0 CHECK (available_eggs >= 0),
  recorded_by        UUID NULL REFERENCES auth.users (id) ON DELETE SET NULL,
  notes              TEXT NULL,
  created_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at         TIMESTAMPTZ NOT NULL DEFAULT now(),

  -- Allocation validation: farm use + sold directly cannot exceed good eggs collected
  CONSTRAINT chk_egg_allocations CHECK (good_eggs - farm_use_eggs - sold_directly_eggs >= 0),
  CONSTRAINT uq_egg_flock_production_date UNIQUE (flock_id, production_date)
);

CREATE INDEX IF NOT EXISTS idx_egg_production_farm_date ON public.egg_production_records (farm_id, production_date);
CREATE TRIGGER trg_egg_production_records_updated_at
  BEFORE UPDATE ON public.egg_production_records
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();

-- Trigger to enforce computed available_eggs consistency
CREATE OR REPLACE FUNCTION public.compute_available_eggs()
RETURNS TRIGGER AS $$
BEGIN
  NEW.available_eggs := NEW.good_eggs - NEW.farm_use_eggs - NEW.sold_directly_eggs;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SET search_path = public, auth;

CREATE TRIGGER trg_enforce_available_eggs
  BEFORE INSERT OR UPDATE ON public.egg_production_records
  FOR EACH ROW EXECUTE FUNCTION public.compute_available_eggs();

-- ────────────────────────────────────────────────────────────────────────────
-- 4. Flock Adjustments Table (Auditable Population History)
-- ────────────────────────────────────────────────────────────────────────────
CREATE TYPE public.flock_adjustment_type AS ENUM ('mortality', 'sale', 'transfer', 'purchase', 'correction', 'other');

CREATE TABLE IF NOT EXISTS public.flock_adjustments (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id          UUID NOT NULL REFERENCES public.farms (id) ON DELETE CASCADE,
  flock_id         UUID NOT NULL REFERENCES public.flocks (id) ON DELETE CASCADE,
  adjustment_type  public.flock_adjustment_type NOT NULL,
  birds_changed    INT NOT NULL, -- negative for mortality/sale/out-transfer, positive for purchase/in-transfer
  hens_changed     INT NOT NULL DEFAULT 0,
  reason           TEXT NULL,
  recorded_at      DATE NOT NULL DEFAULT CURRENT_DATE,
  recorded_by      UUID NULL REFERENCES auth.users (id) ON DELETE SET NULL,
  created_at       TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_flock_adjustments_flock ON public.flock_adjustments (flock_id, recorded_at);

-- Trigger to update current flock populations upon adjustment recording
CREATE OR REPLACE FUNCTION public.apply_flock_adjustment_trigger()
RETURNS TRIGGER AS $$
DECLARE
  v_new_birds INT;
  v_new_hens INT;
BEGIN
  SELECT number_of_birds + NEW.birds_changed, number_of_laying_hens + NEW.hens_changed
  INTO v_new_birds, v_new_hens
  FROM public.flocks
  WHERE id = NEW.flock_id;

  IF v_new_birds < 0 OR v_new_hens < 0 OR v_new_hens > v_new_birds THEN
    RAISE EXCEPTION 'Flock adjustment would result in impossible population count (birds: %, hens: %)', v_new_birds, v_new_hens;
  END IF;

  UPDATE public.flocks
  SET number_of_birds = v_new_birds,
      number_of_laying_hens = v_new_hens,
      updated_at = now()
  WHERE id = NEW.flock_id;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, auth;

CREATE TRIGGER trg_apply_flock_adjustment
  AFTER INSERT ON public.flock_adjustments
  FOR EACH ROW EXECUTE FUNCTION public.apply_flock_adjustment_trigger();

-- ────────────────────────────────────────────────────────────────────────────
-- 5. Row Level Security (RLS) Isolation
-- ────────────────────────────────────────────────────────────────────────────
ALTER TABLE public.flocks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.egg_production_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.flock_adjustments ENABLE ROW LEVEL SECURITY;

-- Flocks Policies
CREATE POLICY flocks_select ON public.flocks FOR SELECT
  USING (farm_id = public.current_farm_id() AND deleted_at IS NULL);

CREATE POLICY flocks_insert ON public.flocks FOR INSERT
  WITH CHECK (farm_id = public.current_farm_id() AND public.get_user_role() = 'admin');

CREATE POLICY flocks_update ON public.flocks FOR UPDATE
  USING (farm_id = public.current_farm_id() AND public.get_user_role() = 'admin');

CREATE POLICY flocks_delete ON public.flocks FOR DELETE
  USING (farm_id = public.current_farm_id() AND public.get_user_role() = 'admin');

-- Egg Production Records Policies
CREATE POLICY egg_prod_select ON public.egg_production_records FOR SELECT
  USING (farm_id = public.current_farm_id());

CREATE POLICY egg_prod_insert ON public.egg_production_records FOR INSERT
  WITH CHECK (farm_id = public.current_farm_id() AND public.get_user_role() IN ('admin', 'user'));

CREATE POLICY egg_prod_update_admin ON public.egg_production_records FOR UPDATE
  USING (farm_id = public.current_farm_id() AND public.get_user_role() = 'admin');

CREATE POLICY egg_prod_update_worker ON public.egg_production_records FOR UPDATE
  USING (farm_id = public.current_farm_id() AND public.get_user_role() = 'user' AND recorded_by = auth.uid() AND created_at >= (now() - INTERVAL '24 hours'));

CREATE POLICY egg_prod_delete ON public.egg_production_records FOR DELETE
  USING (farm_id = public.current_farm_id() AND public.get_user_role() = 'admin');

-- Flock Adjustments Policies
CREATE POLICY flock_adj_select ON public.flock_adjustments FOR SELECT
  USING (farm_id = public.current_farm_id());

CREATE POLICY flock_adj_insert ON public.flock_adjustments FOR INSERT
  WITH CHECK (farm_id = public.current_farm_id() AND public.get_user_role() IN ('admin', 'user'));

CREATE POLICY flock_adj_delete ON public.flock_adjustments FOR DELETE
  USING (farm_id = public.current_farm_id() AND public.get_user_role() = 'admin');

-- Grant execution to authenticated users
GRANT SELECT, INSERT, UPDATE, DELETE ON public.flocks TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.egg_production_records TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.flock_adjustments TO authenticated;

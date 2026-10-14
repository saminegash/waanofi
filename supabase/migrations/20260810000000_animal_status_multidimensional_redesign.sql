-- ============================================================================
-- Phase 0: Animal Status Multidimensional Redesign Migration
-- ============================================================================

-- 1. Create Enums for Independent Dimensions
DO $$ BEGIN
  CREATE TYPE animal_lifecycle_status AS ENUM (
    'active',
    'sold',
    'transferred_out',
    'deceased',
    'culled',
    'missing',
    'unknown'
  );
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
  CREATE TYPE animal_reproductive_status AS ENUM (
    'not_applicable',
    'unknown',
    'open',
    'heat',
    'served',
    'pregnant',
    'postpartum'
  );
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
  CREATE TYPE animal_lactation_status AS ENUM (
    'not_applicable',
    'unknown',
    'lactating',
    'dry'
  );
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
  CREATE TYPE animal_health_status AS ENUM (
    'healthy',
    'sick',
    'under_treatment',
    'quarantined',
    'recovering',
    'unknown'
  );
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
  CREATE TYPE cattle_class AS ENUM (
    'calf',
    'heifer',
    'cow',
    'bull',
    'steer',
    'unknown'
  );
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

-- 2. Add New Columns to animals Table
ALTER TABLE public.animals
  ADD COLUMN IF NOT EXISTS lifecycle_status animal_lifecycle_status NOT NULL DEFAULT 'active',
  ADD COLUMN IF NOT EXISTS reproductive_status animal_reproductive_status NOT NULL DEFAULT 'unknown',
  ADD COLUMN IF NOT EXISTS lactation_status animal_lactation_status NOT NULL DEFAULT 'unknown',
  ADD COLUMN IF NOT EXISTS health_status animal_health_status NOT NULL DEFAULT 'healthy',
  ADD COLUMN IF NOT EXISTS cattle_class cattle_class NOT NULL DEFAULT 'cow',
  ADD COLUMN IF NOT EXISTS location TEXT;

-- 3. Data Backfill from Legacy status Column
UPDATE public.animals
SET
  lifecycle_status = CASE 
    WHEN status = 'sold' THEN 'sold'::animal_lifecycle_status
    WHEN status = 'deceased' THEN 'deceased'::animal_lifecycle_status
    ELSE 'active'::animal_lifecycle_status
  END,
  reproductive_status = CASE 
    WHEN sex = 'male' THEN 'not_applicable'::animal_reproductive_status
    WHEN status = 'pregnant' THEN 'pregnant'::animal_reproductive_status
    WHEN status IN ('active', 'dry') THEN 'open'::animal_reproductive_status
    ELSE 'unknown'::animal_reproductive_status
  END,
  lactation_status = CASE 
    WHEN sex = 'male' THEN 'not_applicable'::animal_lactation_status
    WHEN status = 'dry' THEN 'dry'::animal_lactation_status
    WHEN status = 'pregnant' THEN 'dry'::animal_lactation_status
    WHEN status = 'active' THEN 'lactating'::animal_lactation_status
    ELSE 'unknown'::animal_lactation_status
  END,
  health_status = CASE 
    WHEN status = 'sick' THEN 'sick'::animal_health_status
    ELSE 'healthy'::animal_health_status
  END,
  cattle_class = CASE 
    WHEN sex = 'male' THEN 'bull'::cattle_class
    ELSE 'cow'::cattle_class
  END;

-- 4. Create Indexes for the New Dimensions
CREATE INDEX IF NOT EXISTS idx_animals_lifecycle ON public.animals (farm_id, lifecycle_status);
CREATE INDEX IF NOT EXISTS idx_animals_lactation ON public.animals (farm_id, lactation_status);
CREATE INDEX IF NOT EXISTS idx_animals_reproductive ON public.animals (farm_id, reproductive_status);
CREATE INDEX IF NOT EXISTS idx_animals_health ON public.animals (farm_id, health_status);
CREATE INDEX IF NOT EXISTS idx_animals_cattle_class ON public.animals (farm_id, cattle_class);

-- 5. Create animal_state_logs Table
CREATE TABLE IF NOT EXISTS public.animal_state_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id UUID NOT NULL REFERENCES public.farms(id) ON DELETE CASCADE,
  animal_id UUID NOT NULL REFERENCES public.animals(id) ON DELETE CASCADE,
  dimension TEXT NOT NULL, -- 'lifecycle', 'reproduction', 'lactation', 'health', 'cattle_class', 'location'
  previous_value TEXT,
  new_value TEXT NOT NULL,
  effective_timestamp TIMESTAMPTZ NOT NULL DEFAULT now(),
  recorded_timestamp TIMESTAMPTZ NOT NULL DEFAULT now(),
  recorded_by UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  reason TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_animal_state_logs_animal ON public.animal_state_logs (animal_id, recorded_timestamp DESC);
CREATE INDEX IF NOT EXISTS idx_animal_state_logs_farm ON public.animal_state_logs (farm_id);

-- 6. Enable RLS on animal_state_logs
ALTER TABLE public.animal_state_logs ENABLE ROW LEVEL SECURITY;

-- 7. RLS Policies for animal_state_logs
DROP POLICY IF EXISTS animal_state_logs_select ON public.animal_state_logs;
CREATE POLICY animal_state_logs_select ON public.animal_state_logs FOR SELECT
  USING (farm_id = (SELECT farm_id FROM public.profiles WHERE id = auth.uid()));

DROP POLICY IF EXISTS animal_state_logs_insert ON public.animal_state_logs;
CREATE POLICY animal_state_logs_insert ON public.animal_state_logs FOR INSERT
  WITH CHECK (farm_id = (SELECT farm_id FROM public.profiles WHERE id = auth.uid()));

DROP POLICY IF EXISTS animal_state_logs_update ON public.animal_state_logs;
CREATE POLICY animal_state_logs_update ON public.animal_state_logs FOR UPDATE
  USING (
    farm_id = (SELECT farm_id FROM public.profiles WHERE id = auth.uid())
    AND (SELECT role FROM public.profiles WHERE id = auth.uid()) = 'admin'
  );

DROP POLICY IF EXISTS animal_state_logs_delete ON public.animal_state_logs;
CREATE POLICY animal_state_logs_delete ON public.animal_state_logs FOR DELETE
  USING (
    farm_id = (SELECT farm_id FROM public.profiles WHERE id = auth.uid())
    AND (SELECT role FROM public.profiles WHERE id = auth.uid()) = 'admin'
  );

-- 8. Update Analytics Views
DROP VIEW IF EXISTS public.farm_animal_status_counts;
CREATE OR REPLACE VIEW public.farm_animal_status_counts AS
SELECT 
  farm_id, 
  lifecycle_status::TEXT as status, 
  COUNT(*) as count
FROM public.animals
WHERE deleted_at IS NULL
GROUP BY farm_id, lifecycle_status;

-- Multidimensional breakdown view for rich dashboard stats
CREATE OR REPLACE VIEW public.farm_animal_dimensional_counts AS
SELECT 
  farm_id,
  COUNT(*) FILTER (WHERE lifecycle_status = 'active') as active_count,
  COUNT(*) FILTER (WHERE lifecycle_status = 'sold') as sold_count,
  COUNT(*) FILTER (WHERE lifecycle_status = 'deceased') as deceased_count,
  COUNT(*) FILTER (WHERE lifecycle_status = 'active' AND lactation_status = 'lactating') as lactating_count,
  COUNT(*) FILTER (WHERE lifecycle_status = 'active' AND lactation_status = 'dry') as dry_count,
  COUNT(*) FILTER (WHERE lifecycle_status = 'active' AND reproductive_status = 'pregnant') as pregnant_count,
  COUNT(*) FILTER (WHERE lifecycle_status = 'active' AND health_status IN ('sick', 'under_treatment')) as sick_count
FROM public.animals
WHERE deleted_at IS NULL
GROUP BY farm_id;

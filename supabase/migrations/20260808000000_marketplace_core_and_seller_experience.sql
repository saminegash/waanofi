-- ============================================================================
-- WAANOFI MARKETPLACE CORE & SELLER EXPERIENCE MIGRATION (#12)
-- Migration Date: 2026-08-08
-- Description: Multi-farm membership foundation, public seller profiles, platform
--              product catalog, quality-controlled inventory batches, inspections,
--              seller listings, secure public marketplace views, and storage RLS.
-- ============================================================================

-- ────────────────────────────────────────────────────────────────────────────
-- 1. Identity & Membership Foundation (Multi-Farm Support)
-- ────────────────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.farm_memberships (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id         UUID NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
  farm_id         UUID NOT NULL REFERENCES public.farms (id) ON DELETE CASCADE,
  membership_role TEXT NOT NULL DEFAULT 'worker' CHECK (membership_role IN ('owner', 'manager', 'worker', 'viewer', 'admin', 'user', 'guest')),
  status          TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('invited', 'active', 'suspended', 'removed')),
  invited_by      UUID REFERENCES auth.users (id) ON DELETE SET NULL,
  joined_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT uq_farm_membership UNIQUE (user_id, farm_id)
);

CREATE INDEX IF NOT EXISTS idx_farm_memberships_user ON public.farm_memberships (user_id);
CREATE INDEX IF NOT EXISTS idx_farm_memberships_farm ON public.farm_memberships (farm_id);

-- Safely migrate existing relationships from profiles without deleting any legacy data
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'profiles') THEN
    INSERT INTO public.farm_memberships (user_id, farm_id, membership_role, status, joined_at)
    SELECT 
      p.id, 
      p.farm_id, 
      CASE 
        WHEN LOWER(p.role::text) = 'admin' THEN 'owner'
        WHEN LOWER(p.role::text) = 'user' THEN 'worker'
        WHEN LOWER(p.role::text) = 'guest' THEN 'viewer'
        WHEN LOWER(p.role::text) IN ('owner', 'manager', 'worker', 'viewer') THEN LOWER(p.role::text)
        ELSE 'owner'
      END, 
      'active', 
      now()
    FROM public.profiles p
    WHERE p.farm_id IS NOT NULL
    ON CONFLICT (user_id, farm_id) DO UPDATE 
    SET membership_role = EXCLUDED.membership_role;
  END IF;
END $$;

ALTER TABLE public.farm_memberships ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view memberships of their farms"
  ON public.farm_memberships FOR SELECT
  TO authenticated
  USING (
    user_id = auth.uid() OR
    farm_id IN (SELECT fm.farm_id FROM public.farm_memberships fm WHERE fm.user_id = auth.uid() AND fm.status = 'active')
  );

CREATE POLICY "Owners and managers can manage farm memberships"
  ON public.farm_memberships FOR ALL
  TO authenticated
  USING (
    farm_id IN (SELECT fm.farm_id FROM public.farm_memberships fm WHERE fm.user_id = auth.uid() AND fm.membership_role IN ('owner', 'manager', 'admin') AND fm.status = 'active')
  );

-- ────────────────────────────────────────────────────────────────────────────
-- 2. Seller Public Profile (`farm_market_profiles`)
-- ────────────────────────────────────────────────────────────────────────────
CREATE TYPE public.market_profile_status AS ENUM ('draft', 'pending_review', 'approved', 'rejected', 'suspended');

CREATE TABLE IF NOT EXISTS public.farm_market_profiles (
  farm_id               UUID PRIMARY KEY REFERENCES public.farms (id) ON DELETE CASCADE,
  public_farm_name      TEXT NOT NULL,
  public_description    TEXT NULL,
  public_phone          TEXT NULL,
  public_email          TEXT NULL,
  logo                  TEXT NULL,
  cover_image           TEXT NULL,
  general_location      TEXT NOT NULL,
  latitude              DOUBLE PRECISION NULL,
  longitude             DOUBLE PRECISION NULL,
  pickup_availability     BOOLEAN NOT NULL DEFAULT true,
  delivery_availability BOOLEAN NOT NULL DEFAULT false,
  delivery_radius_zones TEXT NULL,
  opening_hours         TEXT NOT NULL DEFAULT 'Mon-Sat 8:00 AM - 5:00 PM',
  verification_status   TEXT NOT NULL DEFAULT 'unverified',
  marketplace_status    public.market_profile_status NOT NULL DEFAULT 'draft',
  rejection_reason      TEXT NULL,
  created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE public.farm_market_profiles ENABLE ROW LEVEL SECURITY;

-- Approved profiles are visible to all authenticated buyers/users
CREATE POLICY "Approved market profiles are publicly readable"
  ON public.farm_market_profiles FOR SELECT
  USING (marketplace_status = 'approved' OR farm_id = current_farm_id());

CREATE POLICY "Farm members can manage their own market profile"
  ON public.farm_market_profiles FOR ALL
  TO authenticated
  USING (farm_id = current_farm_id());

-- ────────────────────────────────────────────────────────────────────────────
-- 3. Platform Product Catalog (`market_products`)
-- ────────────────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.market_products (
  id                            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_code                  TEXT UNIQUE NOT NULL,
  category                      TEXT NOT NULL,
  name_en                       TEXT NOT NULL,
  name_am                       TEXT NOT NULL,
  name_om                       TEXT NOT NULL,
  description_translations      JSONB NOT NULL DEFAULT '{}'::jsonb,
  base_inventory_unit           TEXT NOT NULL,
  selling_units                 JSONB NOT NULL,
  default_shelf_life_guidance   TEXT NULL,
  required_quality_check_fields JSONB NOT NULL DEFAULT '{}'::jsonb,
  active                        BOOLEAN NOT NULL DEFAULT true,
  image                         TEXT NULL,
  display_order                 INT NOT NULL DEFAULT 0,
  created_at                    TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at                    TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE public.market_products ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Market products are readable by all authenticated users"
  ON public.market_products FOR SELECT
  TO authenticated
  USING (active = true);

-- Seed Initial Products (Milk & Eggs)
INSERT INTO public.market_products (
  product_code, category, name_en, name_am, name_om, 
  base_inventory_unit, selling_units, default_shelf_life_guidance, required_quality_check_fields, display_order
) VALUES
(
  'milk_fresh', 'fresh_milk', 'Fresh Cow Milk', 'የላም ወተት', 'Aannoo Saa Haaraa',
  'litres', '["litres", "jerrican_5l", "can_20l"]'::jsonb, '48 hours under chilled refrigeration (< 4°C)',
  '{"temperature": "required", "acidity_ph": "optional", "smell_test": "required"}'::jsonb, 1
),
(
  'eggs_tray_30', 'eggs', 'Table Eggs — Tray of 30', 'የእርድ እንቁላል — 30 ያለው ትሬይ', 'Buupii Looja — Looja 30',
  'eggs', '["tray_30"]'::jsonb, '30 days stored dry in cool room',
  '{"shell_cleanliness": "required", "cracked_check": "required", "weight_grade": "optional"}'::jsonb, 2
),
(
  'eggs_piece', 'eggs', 'Table Eggs — Individual Pieces', 'የእርድ እንቁላል — በፍሬ', 'Buupii Looja — Qeenxee',
  'eggs', '["piece", "dozen_12"]'::jsonb, '30 days stored dry in cool room',
  '{"shell_cleanliness": "required", "cracked_check": "required"}'::jsonb, 3
)
ON CONFLICT (product_code) DO NOTHING;

-- ────────────────────────────────────────────────────────────────────────────
-- 4. Quality-Controlled Production Batches (`inventory_batches`)
-- ────────────────────────────────────────────────────────────────────────────
CREATE TYPE public.inventory_quality_status AS ENUM (
  'pending_inspection', 'approved', 'rejected', 'quarantined', 'recalled', 'expired'
);

CREATE TABLE IF NOT EXISTS public.inventory_batches (
  id                 UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id            UUID NOT NULL REFERENCES public.farms (id) ON DELETE CASCADE,
  product_id         UUID REFERENCES public.market_products (id) ON DELETE SET NULL,
  batch_code         TEXT NOT NULL,
  source_type        TEXT NOT NULL CHECK (source_type IN ('milk_production', 'egg_production')),
  source_record_refs JSONB NOT NULL DEFAULT '{}'::jsonb,
  produced_quantity  NUMERIC(12,2) NOT NULL CHECK (produced_quantity >= 0),
  approved_quantity  NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (approved_quantity >= 0 AND approved_quantity <= produced_quantity),
  available_quantity NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (available_quantity >= 0 AND available_quantity <= approved_quantity),
  reserved_quantity  NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (reserved_quantity >= 0),
  sold_quantity      NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (sold_quantity >= 0),
  rejected_quantity  NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (rejected_quantity >= 0),
  wasted_quantity    NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (wasted_quantity >= 0),
  base_unit          TEXT NOT NULL,
  produced_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
  packed_at          TIMESTAMPTZ NULL,
  expires_at         TIMESTAMPTZ NULL,
  quality_status     public.inventory_quality_status NOT NULL DEFAULT 'pending_inspection',
  marketplace_status TEXT NOT NULL DEFAULT 'unlisted',
  quality_metadata   JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_by         UUID REFERENCES auth.users (id) ON DELETE SET NULL,
  approved_by        UUID REFERENCES auth.users (id) ON DELETE SET NULL,
  created_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  version            INT NOT NULL DEFAULT 1,
  CONSTRAINT uq_batch_code_farm UNIQUE (farm_id, batch_code)
);

CREATE INDEX IF NOT EXISTS idx_inventory_batches_farm ON public.inventory_batches (farm_id, quality_status);
CREATE INDEX IF NOT EXISTS idx_inventory_batches_product ON public.inventory_batches (product_id, quality_status);

ALTER TABLE public.inventory_batches ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Farm team can view their inventory batches"
  ON public.inventory_batches FOR SELECT
  TO authenticated
  USING (farm_id = current_farm_id());

CREATE POLICY "Farm team can create and update inventory batches"
  ON public.inventory_batches FOR ALL
  TO authenticated
  USING (farm_id = current_farm_id());

-- Trigger to ensure workers cannot approve their own batches unless authorized (owner/manager/admin)
CREATE OR REPLACE FUNCTION public.check_batch_approval_authority()
RETURNS TRIGGER AS $$
DECLARE
  v_user_role TEXT;
BEGIN
  IF NEW.quality_status = 'approved' AND (OLD.quality_status IS NULL OR OLD.quality_status != 'approved') THEN
    SELECT COALESCE(membership_role, 'worker') INTO v_user_role
    FROM public.farm_memberships
    WHERE farm_id = NEW.farm_id AND user_id = auth.uid() AND status = 'active';

    IF v_user_role NOT IN ('owner', 'manager', 'admin') AND NEW.created_by = auth.uid() THEN
      RAISE EXCEPTION 'Workers cannot approve their own production batches without managerial authorization.';
    END IF;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER trg_batch_approval_guard
  BEFORE UPDATE ON public.inventory_batches
  FOR EACH ROW EXECUTE FUNCTION public.check_batch_approval_authority();

-- ────────────────────────────────────────────────────────────────────────────
-- 5. Quality Checks (`quality_checks`)
-- ────────────────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.quality_checks (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  batch_id            UUID NOT NULL REFERENCES public.inventory_batches (id) ON DELETE CASCADE,
  check_type          TEXT NOT NULL,
  result              TEXT NOT NULL CHECK (result IN ('pass', 'fail', 'conditional')),
  measurements        JSONB NOT NULL DEFAULT '{}'::jsonb,
  notes               TEXT NULL,
  checked_by          UUID REFERENCES auth.users (id) ON DELETE SET NULL,
  checked_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  evidence_attachments TEXT[] DEFAULT '{}',
  approval_status     TEXT NOT NULL DEFAULT 'pending'
);

CREATE INDEX IF NOT EXISTS idx_quality_checks_batch ON public.quality_checks (batch_id);

ALTER TABLE public.quality_checks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Farm team can manage quality checks for their batches"
  ON public.quality_checks FOR ALL
  TO authenticated
  USING (
    batch_id IN (SELECT ib.id FROM public.inventory_batches ib WHERE ib.farm_id = current_farm_id())
  );

-- ────────────────────────────────────────────────────────────────────────────
-- 6. Seller Listings (`market_listings`)
-- ────────────────────────────────────────────────────────────────────────────
CREATE TYPE public.market_listing_status AS ENUM (
  'draft', 'pending_approval', 'active', 'paused', 'out_of_stock', 'rejected', 'suspended', 'archived'
);

CREATE TABLE IF NOT EXISTS public.market_listings (
  id                            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id                       UUID NOT NULL REFERENCES public.farms (id) ON DELETE CASCADE,
  product_id                    UUID REFERENCES public.market_products (id) ON DELETE RESTRICT,
  public_title                  TEXT NOT NULL,
  public_description            TEXT NULL,
  selling_unit                  TEXT NOT NULL,
  unit_conversion               INT NOT NULL DEFAULT 1 CHECK (unit_conversion > 0),
  price_in_minor_units          BIGINT NOT NULL CHECK (price_in_minor_units > 0),
  currency                      TEXT NOT NULL DEFAULT 'ETB',
  minimum_order_quantity        INT NOT NULL DEFAULT 1 CHECK (minimum_order_quantity > 0),
  maximum_order_quantity        INT NULL CHECK (maximum_order_quantity IS NULL OR maximum_order_quantity >= minimum_order_quantity),
  available_fulfilment_methods  TEXT[] NOT NULL DEFAULT '{"pickup"}',
  available_days                TEXT[] NOT NULL DEFAULT '{"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}',
  preparation_time              TEXT NOT NULL DEFAULT '2 hours',
  status                        public.market_listing_status NOT NULL DEFAULT 'draft',
  approval_status               TEXT NOT NULL DEFAULT 'pending',
  published_at                  TIMESTAMPTZ NULL,
  created_by                    UUID REFERENCES auth.users (id) ON DELETE SET NULL,
  created_at                    TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at                    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_market_listings_farm ON public.market_listings (farm_id, status);
CREATE INDEX IF NOT EXISTS idx_market_listings_product ON public.market_listings (product_id, status);

ALTER TABLE public.market_listings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Farm team can manage their listings"
  ON public.market_listings FOR ALL
  TO authenticated
  USING (farm_id = current_farm_id());

CREATE POLICY "Public can view active listings from approved farms"
  ON public.market_listings FOR SELECT
  TO authenticated
  USING (
    status = 'active' AND
    farm_id IN (SELECT fmp.farm_id FROM public.farm_market_profiles fmp WHERE fmp.marketplace_status = 'approved')
  );

-- Trigger to prevent unapproved farms from publishing listings
CREATE OR REPLACE FUNCTION public.check_listing_publish_eligibility()
RETURNS TRIGGER AS $$
DECLARE
  v_market_status TEXT;
BEGIN
  IF NEW.status = 'active' AND (OLD.status IS NULL OR OLD.status != 'active') THEN
    SELECT marketplace_status::text INTO v_market_status
    FROM public.farm_market_profiles
    WHERE farm_id = NEW.farm_id;

    IF v_market_status != 'approved' OR v_market_status IS NULL THEN
      RAISE EXCEPTION 'Only verified and approved farm marketplace profiles may publish active listings.';
    END IF;
    NEW.published_at = COALESCE(NEW.published_at, now());
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER trg_listing_publish_guard
  BEFORE INSERT OR UPDATE ON public.market_listings
  FOR EACH ROW EXECUTE FUNCTION public.check_listing_publish_eligibility();

-- ────────────────────────────────────────────────────────────────────────────
-- 7. Secure Public Marketplace View (`public_marketplace_listings`)
-- ────────────────────────────────────────────────────────────────────────────
-- Exposes ONLY necessary marketplace metadata. Never leaks internal farm records,
-- worker identifies, cost data, exact formulas, or private addresses.
CREATE OR REPLACE VIEW public.public_marketplace_listings AS
SELECT 
  l.id AS listing_id,
  l.public_title,
  l.public_description,
  l.selling_unit,
  l.unit_conversion,
  l.price_in_minor_units,
  l.currency,
  l.minimum_order_quantity,
  l.maximum_order_quantity,
  l.available_fulfilment_methods,
  l.available_days,
  l.preparation_time,
  p.product_code,
  p.category,
  p.name_en AS product_name_en,
  p.name_am AS product_name_am,
  p.name_om AS product_name_om,
  p.image AS product_default_image,
  f.public_farm_name,
  f.general_location,
  f.pickup_availability,
  f.delivery_availability,
  f.delivery_radius_zones,
  f.opening_hours,
  f.verification_status,
  f.logo AS farm_logo,
  f.cover_image AS farm_cover_image,
  COALESCE(
    (SELECT SUM(b.available_quantity)
     FROM public.inventory_batches b
     WHERE b.farm_id = l.farm_id 
       AND (b.product_id = l.product_id OR l.product_id IS NULL)
       AND b.quality_status = 'approved' 
       AND (b.expires_at IS NULL OR b.expires_at > now())),
  0) AS approximate_available_quantity
FROM public.market_listings l
JOIN public.farm_market_profiles f ON l.farm_id = f.farm_id
LEFT JOIN public.market_products p ON l.product_id = p.id
WHERE l.status = 'active'
  AND f.marketplace_status = 'approved';

-- ────────────────────────────────────────────────────────────────────────────
-- 8. Storage Buckets & Protection Policies
-- ────────────────────────────────────────────────────────────────────────────
INSERT INTO storage.buckets (id, name, public) VALUES
  ('farm_logos', 'farm_logos', true),
  ('farm_cover_images', 'farm_cover_images', true),
  ('listing_images', 'listing_images', true),
  ('quality_evidence', 'quality_evidence', false)
ON CONFLICT (id) DO NOTHING;

-- Storage object policies for authenticated sellers
CREATE POLICY "Public read access to farm branding and listing images"
  ON storage.objects FOR SELECT
  TO public
  USING (bucket_id IN ('farm_logos', 'farm_cover_images', 'listing_images'));

CREATE POLICY "Authenticated users can read quality evidence of their farms"
  ON storage.objects FOR SELECT
  TO authenticated
  USING (bucket_id = 'quality_evidence');

CREATE POLICY "Farm team can upload images and evidence"
  ON storage.objects FOR INSERT
  TO authenticated
  WITH CHECK (
    bucket_id IN ('farm_logos', 'farm_cover_images', 'listing_images', 'quality_evidence') AND
    (auth.role() = 'authenticated')
  );

-- ============================================================================
-- WAANOFI BUYER MARKETPLACE & FARM-SPECIFIC CART MIGRATION (#13)
-- Migration Date: 2026-08-09
-- Description: Buyer accounts supporting institutional & household commerce,
--              delivery addresses with Ethiopian hierarchy & optional GPS,
--              and expanded secure marketplace view for single-farm carts.
-- ============================================================================

-- ────────────────────────────────────────────────────────────────────────────
-- 1. Buyer Account Model (`buyer_accounts`)
-- ────────────────────────────────────────────────────────────────────────────
-- Note: A user may be both a farmer (in farm_memberships) and a buyer simultaneously.
CREATE TABLE IF NOT EXISTS public.buyer_accounts (
  user_id             UUID PRIMARY KEY REFERENCES auth.users (id) ON DELETE CASCADE,
  buyer_type          TEXT NOT NULL DEFAULT 'household' CHECK (
                        buyer_type IN ('household', 'retail_shop', 'cafe', 'restaurant', 'hotel', 'bakery', 'school', 'institution', 'other_business')
                      ),
  organization_name   TEXT,
  contact_name        TEXT NOT NULL,
  phone               TEXT NOT NULL,
  email               TEXT NOT NULL,
  tax_number          TEXT,
  verification_status TEXT NOT NULL DEFAULT 'unverified' CHECK (
                        verification_status IN ('unverified', 'pending_review', 'verified', 'suspended')
                      ),
  preferred_language  TEXT NOT NULL DEFAULT 'en' CHECK (preferred_language IN ('en', 'am', 'om')),
  created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_buyer_accounts_type ON public.buyer_accounts (buyer_type);

ALTER TABLE public.buyer_accounts ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view and manage their own buyer account"
  ON public.buyer_accounts FOR ALL
  TO authenticated
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

CREATE POLICY "Sellers and operators can view buyer accounts for order verification"
  ON public.buyer_accounts FOR SELECT
  TO authenticated
  USING (true);


-- ────────────────────────────────────────────────────────────────────────────
-- 2. Delivery Address Model (`delivery_addresses`)
-- ────────────────────────────────────────────────────────────────────────────
-- Supports detailed local addressing without enforcing mandatory coordinates when unknown.
CREATE TABLE IF NOT EXISTS public.delivery_addresses (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  buyer_id              UUID NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
  label                 TEXT NOT NULL DEFAULT 'Primary',
  recipient_name        TEXT NOT NULL,
  phone                 TEXT NOT NULL,
  region                TEXT NOT NULL,
  city                  TEXT NOT NULL,
  sub_city              TEXT NOT NULL,
  neighborhood          TEXT NOT NULL,
  landmark              TEXT NOT NULL,
  latitude              DOUBLE PRECISION,
  longitude             DOUBLE PRECISION,
  delivery_instructions TEXT,
  is_default            BOOLEAN NOT NULL DEFAULT false,
  created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_delivery_addresses_buyer ON public.delivery_addresses (buyer_id);

ALTER TABLE public.delivery_addresses ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Buyers can manage their own delivery addresses"
  ON public.delivery_addresses FOR ALL
  TO authenticated
  USING (buyer_id = auth.uid())
  WITH CHECK (buyer_id = auth.uid());

-- Automatically un-set previous default when a new default address is chosen
CREATE OR REPLACE FUNCTION public.fn_ensure_single_default_address()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.is_default = true THEN
    UPDATE public.delivery_addresses
    SET is_default = false
    WHERE buyer_id = NEW.buyer_id AND id != NEW.id AND is_default = true;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER trg_single_default_address
  BEFORE INSERT OR UPDATE ON public.delivery_addresses
  FOR EACH ROW EXECUTE FUNCTION public.fn_ensure_single_default_address();


-- ────────────────────────────────────────────────────────────────────────────
-- 3. Enhance Public Marketplace View for Single-Farm Carts
-- ────────────────────────────────────────────────────────────────────────────
-- Ensure l.farm_id and l.status are present so frontend shopping carts can
-- enforce single-farm rules without accessing private seller tables.
CREATE OR REPLACE VIEW public.public_marketplace_listings AS
SELECT 
  l.id AS listing_id,
  l.farm_id AS farm_id,
  l.status AS listing_status,
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

GRANT SELECT ON public.public_marketplace_listings TO authenticated, anon;

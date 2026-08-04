-- ============================================================================
-- Waanofi Marketplace Foundation — Migration #10
-- ============================================================================
-- Adds: egg production recording, production batches, marketplace listings,
--        orders with delivery tracking, and server-side order processing.
--
-- Money convention: BIGINT minor units (santim = 1/100 ETB).
-- All prices/totals computed server-side. Client values are NEVER trusted.
-- ============================================================================

-- ─────────────────────── Enums ───────────────────────

CREATE TYPE egg_production_type AS ENUM ('free_range', 'caged', 'organic');

CREATE TYPE product_category AS ENUM ('fresh_milk', 'eggs');

CREATE TYPE batch_status AS ENUM (
  'pending',      -- recorded, awaiting admin approval
  'approved',     -- admin approved, can be listed
  'listed',       -- actively listed on marketplace
  'sold_out',     -- all quantity sold
  'expired',      -- past expiry date
  'cancelled'     -- manually cancelled
);

CREATE TYPE marketplace_order_status AS ENUM (
  'pending',            -- buyer placed order, awaiting seller confirmation
  'confirmed',          -- seller confirmed
  'processing',         -- seller preparing order
  'ready_for_delivery', -- packaged and ready
  'out_for_delivery',   -- in transit
  'delivered',          -- delivered to buyer
  'completed',          -- buyer confirmed receipt
  'cancelled'           -- cancelled by buyer or seller
);

CREATE TYPE payment_status AS ENUM ('unpaid', 'pending', 'paid', 'refunded');

CREATE TYPE payment_method AS ENUM (
  'cash_on_delivery',
  'telebirr',
  'cbe',
  'bank_transfer'
);

CREATE TYPE delivery_status AS ENUM (
  'pending',     -- awaiting assignment
  'assigned',    -- driver/courier assigned
  'picked_up',   -- picked up from farm
  'in_transit',  -- on the way
  'delivered',   -- delivered to buyer
  'failed'       -- delivery failed
);

-- ─────────────────────── Tables ───────────────────────

-- Egg production records (per flock/house, offline-capable)
CREATE TABLE egg_records (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id       UUID NOT NULL REFERENCES farms (id) ON DELETE CASCADE,
  flock_name    TEXT NOT NULL,                         -- e.g. "House A", "Free-range flock"
  production_type egg_production_type NOT NULL DEFAULT 'free_range',
  recorded_at   DATE NOT NULL DEFAULT CURRENT_DATE,
  quantity       INT NOT NULL CHECK (quantity >= 0),    -- number of eggs collected
  broken_count   INT NOT NULL DEFAULT 0 CHECK (broken_count >= 0),
  notes         TEXT,
  recorded_by   UUID NOT NULL REFERENCES auth.users (id) ON DELETE SET NULL,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now(),

  -- One entry per flock per day
  CONSTRAINT uq_egg_flock_date UNIQUE (farm_id, flock_name, recorded_at)
);

CREATE INDEX idx_egg_records_farm_date ON egg_records (farm_id, recorded_at);

-- Production batches (source of marketplace inventory)
CREATE TABLE production_batches (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id             UUID NOT NULL REFERENCES farms (id) ON DELETE CASCADE,
  category            product_category NOT NULL,
  batch_label         TEXT NOT NULL,                   -- e.g. "Morning Milk 2026-08-05", "Eggs Batch #12"
  quantity_total      NUMERIC(12,2) NOT NULL CHECK (quantity_total > 0),
  quantity_available  NUMERIC(12,2) NOT NULL CHECK (quantity_available >= 0),
  unit                TEXT NOT NULL,                   -- 'litres', 'eggs', 'tray(30)'
  unit_price_minor    BIGINT NOT NULL CHECK (unit_price_minor > 0), -- price per unit in santim
  currency            TEXT NOT NULL DEFAULT 'ETB',
  production_date     DATE NOT NULL DEFAULT CURRENT_DATE,
  expiry_date         DATE,
  status              batch_status NOT NULL DEFAULT 'pending',
  approved_by         UUID REFERENCES auth.users (id) ON DELETE SET NULL,
  approved_at         TIMESTAMPTZ,
  created_by          UUID NOT NULL REFERENCES auth.users (id) ON DELETE SET NULL,
  created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at          TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT chk_batch_qty CHECK (quantity_available <= quantity_total)
);

CREATE INDEX idx_batches_farm ON production_batches (farm_id, status);
CREATE INDEX idx_batches_category ON production_batches (category, status);

-- Marketplace listings (public-facing, derived from approved batches)
CREATE TABLE marketplace_listings (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id             UUID NOT NULL REFERENCES farms (id) ON DELETE CASCADE,
  batch_id            UUID NOT NULL REFERENCES production_batches (id) ON DELETE CASCADE,
  category            product_category NOT NULL,
  title               TEXT NOT NULL,
  description         TEXT,
  unit                TEXT NOT NULL,
  unit_price_minor    BIGINT NOT NULL CHECK (unit_price_minor > 0),
  currency            TEXT NOT NULL DEFAULT 'ETB',
  quantity_available  NUMERIC(12,2) NOT NULL CHECK (quantity_available >= 0),
  photo_url           TEXT,
  is_active           BOOLEAN NOT NULL DEFAULT true,
  created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_listings_active ON marketplace_listings (is_active, category);
CREATE INDEX idx_listings_farm ON marketplace_listings (farm_id);

-- Orders (one order = one seller farm)
CREATE TABLE orders (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_number        TEXT NOT NULL UNIQUE,            -- human-readable, e.g. "WNF-20260805-001"
  buyer_id            UUID NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
  seller_farm_id      UUID NOT NULL REFERENCES farms (id) ON DELETE CASCADE,
  status              marketplace_order_status NOT NULL DEFAULT 'pending',
  payment_status      payment_status NOT NULL DEFAULT 'unpaid',
  payment_method      payment_method NOT NULL DEFAULT 'cash_on_delivery',
  subtotal_minor      BIGINT NOT NULL CHECK (subtotal_minor >= 0),
  delivery_fee_minor  BIGINT NOT NULL DEFAULT 0 CHECK (delivery_fee_minor >= 0),
  total_amount_minor  BIGINT NOT NULL CHECK (total_amount_minor >= 0),
  currency            TEXT NOT NULL DEFAULT 'ETB',
  buyer_name          TEXT NOT NULL,                   -- snapshot
  buyer_phone         TEXT,
  delivery_address    TEXT NOT NULL,
  delivery_notes      TEXT,
  created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_orders_buyer ON orders (buyer_id, created_at DESC);
CREATE INDEX idx_orders_seller ON orders (seller_farm_id, created_at DESC);
CREATE INDEX idx_orders_status ON orders (status);

-- Order items (immutable snapshots of what was ordered)
CREATE TABLE order_items (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id            UUID NOT NULL REFERENCES orders (id) ON DELETE CASCADE,
  listing_id          UUID REFERENCES marketplace_listings (id) ON DELETE SET NULL,
  batch_id            UUID REFERENCES production_batches (id) ON DELETE SET NULL,
  product_name        TEXT NOT NULL,                   -- snapshot at order time
  product_category    product_category NOT NULL,
  unit                TEXT NOT NULL,                   -- snapshot
  quantity            NUMERIC(12,2) NOT NULL CHECK (quantity > 0),
  unit_price_minor    BIGINT NOT NULL CHECK (unit_price_minor > 0), -- snapshot
  line_total_minor    BIGINT NOT NULL CHECK (line_total_minor >= 0),
  currency            TEXT NOT NULL DEFAULT 'ETB',
  created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_order_items_order ON order_items (order_id);

-- Order status history (immutable audit trail)
CREATE TABLE order_status_history (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id      UUID NOT NULL REFERENCES orders (id) ON DELETE CASCADE,
  old_status    marketplace_order_status,
  new_status    marketplace_order_status NOT NULL,
  changed_by    UUID NOT NULL REFERENCES auth.users (id) ON DELETE SET NULL,
  notes         TEXT,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_order_history ON order_status_history (order_id, created_at);

-- Delivery tracking
CREATE TABLE delivery_info (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id              UUID NOT NULL UNIQUE REFERENCES orders (id) ON DELETE CASCADE,
  status                delivery_status NOT NULL DEFAULT 'pending',
  assigned_driver_name  TEXT,
  assigned_driver_phone TEXT,
  picked_up_at          TIMESTAMPTZ,
  delivered_at          TIMESTAMPTZ,
  estimated_delivery_at TIMESTAMPTZ,
  delivery_notes        TEXT,
  created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ─────────────────────── Auto-update timestamps ───────────────────────

CREATE TRIGGER trg_production_batches_updated_at
  BEFORE UPDATE ON production_batches FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER trg_marketplace_listings_updated_at
  BEFORE UPDATE ON marketplace_listings FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER trg_orders_updated_at
  BEFORE UPDATE ON orders FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER trg_delivery_info_updated_at
  BEFORE UPDATE ON delivery_info FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ─────────────────────── Audit triggers ───────────────────────

CREATE TRIGGER trg_audit_egg_records
  AFTER INSERT OR UPDATE OR DELETE ON egg_records
  FOR EACH ROW EXECUTE FUNCTION audit_record_changes();

CREATE TRIGGER trg_audit_orders
  AFTER INSERT OR UPDATE OR DELETE ON orders
  FOR EACH ROW EXECUTE FUNCTION audit_record_changes();

-- ═══════════════════════════════════════════════════════════════════
-- ROW LEVEL SECURITY
-- ═══════════════════════════════════════════════════════════════════

ALTER TABLE egg_records            ENABLE ROW LEVEL SECURITY;
ALTER TABLE production_batches     ENABLE ROW LEVEL SECURITY;
ALTER TABLE marketplace_listings   ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders                 ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items            ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_status_history   ENABLE ROW LEVEL SECURITY;
ALTER TABLE delivery_info          ENABLE ROW LEVEL SECURITY;

-- ─────────────────────── egg_records (farm-scoped, same as milk) ───────────────────────

CREATE POLICY egg_records_select ON egg_records FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
  );

CREATE POLICY egg_records_insert ON egg_records FOR INSERT
  WITH CHECK (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
    AND recorded_by = auth.uid()
  );

CREATE POLICY egg_records_update_admin ON egg_records FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY egg_records_update_worker ON egg_records FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'user'
    AND recorded_by = auth.uid()
    AND created_at > now() - INTERVAL '24 hours'
  );

CREATE POLICY egg_records_delete_admin ON egg_records FOR DELETE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

-- ─────────────────────── production_batches ───────────────────────

-- Farm members see own farm's batches
CREATE POLICY batches_select_own ON production_batches FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
  );

-- Any authenticated user can see listed batches (for marketplace browse)
CREATE POLICY batches_select_listed ON production_batches FOR SELECT
  USING (
    status = 'listed'
    AND auth.uid() IS NOT NULL
  );

-- Only farm admin can create batches
CREATE POLICY batches_insert ON production_batches FOR INSERT
  WITH CHECK (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
    AND created_by = auth.uid()
  );

-- Only farm admin can update batches
CREATE POLICY batches_update ON production_batches FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

-- ─────────────────────── marketplace_listings ───────────────────────

-- Any authenticated user can browse active listings
CREATE POLICY listings_select_public ON marketplace_listings FOR SELECT
  USING (
    is_active = true
    AND auth.uid() IS NOT NULL
  );

-- Farm members see all their listings (including inactive)
CREATE POLICY listings_select_own ON marketplace_listings FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
  );

-- Only farm admin can manage listings
CREATE POLICY listings_insert ON marketplace_listings FOR INSERT
  WITH CHECK (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY listings_update ON marketplace_listings FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY listings_delete ON marketplace_listings FOR DELETE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

-- ─────────────────────── orders ───────────────────────

-- Buyers see their own orders
CREATE POLICY orders_select_buyer ON orders FOR SELECT
  USING (buyer_id = auth.uid());

-- Seller farm admin sees orders for their farm
CREATE POLICY orders_select_seller ON orders FOR SELECT
  USING (
    seller_farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

-- Orders are created via RPC (place_order), not direct insert
-- But we still need a policy for the RPC's SECURITY DEFINER bypass
CREATE POLICY orders_insert ON orders FOR INSERT
  WITH CHECK (buyer_id = auth.uid());

-- Only status updates allowed, via RPC
CREATE POLICY orders_update_seller ON orders FOR UPDATE
  USING (
    seller_farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

-- ─────────────────────── order_items ───────────────────────

-- Visible if the parent order is visible
CREATE POLICY order_items_select_buyer ON order_items FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM orders
      WHERE orders.id = order_items.order_id
        AND orders.buyer_id = auth.uid()
    )
  );

CREATE POLICY order_items_select_seller ON order_items FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM orders
      WHERE orders.id = order_items.order_id
        AND orders.seller_farm_id = current_farm_id()
        AND get_user_role() = 'admin'
    )
  );

CREATE POLICY order_items_insert ON order_items FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM orders
      WHERE orders.id = order_items.order_id
        AND orders.buyer_id = auth.uid()
    )
  );

-- ─────────────────────── order_status_history ───────────────────────

CREATE POLICY order_history_select_buyer ON order_status_history FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM orders
      WHERE orders.id = order_status_history.order_id
        AND orders.buyer_id = auth.uid()
    )
  );

CREATE POLICY order_history_select_seller ON order_status_history FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM orders
      WHERE orders.id = order_status_history.order_id
        AND orders.seller_farm_id = current_farm_id()
        AND get_user_role() = 'admin'
    )
  );

-- ─────────────────────── delivery_info ───────────────────────

CREATE POLICY delivery_info_select_buyer ON delivery_info FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM orders
      WHERE orders.id = delivery_info.order_id
        AND orders.buyer_id = auth.uid()
    )
  );

CREATE POLICY delivery_info_select_seller ON delivery_info FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM orders
      WHERE orders.id = delivery_info.order_id
        AND orders.seller_farm_id = current_farm_id()
        AND get_user_role() = 'admin'
    )
  );

CREATE POLICY delivery_info_update_seller ON delivery_info FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM orders
      WHERE orders.id = delivery_info.order_id
        AND orders.seller_farm_id = current_farm_id()
        AND get_user_role() = 'admin'
    )
  );

-- ═══════════════════════════════════════════════════════════════════
-- SERVER-SIDE FUNCTIONS (SECURITY DEFINER)
-- ═══════════════════════════════════════════════════════════════════

-- Generate a human-readable order number
CREATE OR REPLACE FUNCTION generate_order_number()
RETURNS TEXT AS $$
DECLARE
  v_date TEXT;
  v_seq INT;
BEGIN
  v_date := TO_CHAR(now(), 'YYYYMMDD');
  SELECT COUNT(*) + 1 INTO v_seq
  FROM orders
  WHERE created_at::DATE = CURRENT_DATE;
  RETURN 'WNF-' || v_date || '-' || LPAD(v_seq::TEXT, 3, '0');
END;
$$ LANGUAGE plpgsql;

-- Approve a production batch and optionally create a listing
CREATE OR REPLACE FUNCTION approve_and_list_batch(
  p_batch_id UUID,
  p_title TEXT DEFAULT NULL,
  p_description TEXT DEFAULT NULL
)
RETURNS JSON AS $$
DECLARE
  v_batch production_batches%ROWTYPE;
  v_listing_id UUID;
BEGIN
  -- Validate caller is farm admin for this batch
  SELECT * INTO v_batch FROM production_batches WHERE id = p_batch_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Batch not found';
  END IF;

  IF NOT is_farm_admin(v_batch.farm_id) THEN
    RAISE EXCEPTION 'Forbidden: only farm admin can approve batches';
  END IF;

  IF v_batch.status != 'pending' THEN
    RAISE EXCEPTION 'Batch is not in pending status (current: %)', v_batch.status;
  END IF;

  -- Approve the batch
  UPDATE production_batches
  SET status = 'approved',
      approved_by = auth.uid(),
      approved_at = now()
  WHERE id = p_batch_id;

  -- If title provided, also create a listing and set status to 'listed'
  IF p_title IS NOT NULL THEN
    INSERT INTO marketplace_listings (
      farm_id, batch_id, category, title, description,
      unit, unit_price_minor, currency, quantity_available
    ) VALUES (
      v_batch.farm_id, p_batch_id, v_batch.category,
      p_title, p_description,
      v_batch.unit, v_batch.unit_price_minor, v_batch.currency,
      v_batch.quantity_available
    )
    RETURNING id INTO v_listing_id;

    UPDATE production_batches SET status = 'listed' WHERE id = p_batch_id;
  END IF;

  RETURN json_build_object(
    'batch_id', p_batch_id,
    'status', CASE WHEN p_title IS NOT NULL THEN 'listed' ELSE 'approved' END,
    'listing_id', v_listing_id
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

-- Place an order (server-side validation of prices and inventory)
CREATE OR REPLACE FUNCTION place_order(
  p_listing_id UUID,
  p_quantity NUMERIC(12,2),
  p_payment_method payment_method,
  p_buyer_name TEXT,
  p_buyer_phone TEXT,
  p_delivery_address TEXT,
  p_delivery_notes TEXT DEFAULT NULL
)
RETURNS JSON AS $$
DECLARE
  v_listing marketplace_listings%ROWTYPE;
  v_batch production_batches%ROWTYPE;
  v_order_id UUID;
  v_order_number TEXT;
  v_line_total BIGINT;
  v_buyer_id UUID;
BEGIN
  v_buyer_id := auth.uid();
  IF v_buyer_id IS NULL THEN
    RAISE EXCEPTION 'Not authenticated';
  END IF;

  -- Lock the listing row to prevent race conditions
  SELECT * INTO v_listing
  FROM marketplace_listings
  WHERE id = p_listing_id AND is_active = true
  FOR UPDATE;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Listing not found or no longer active';
  END IF;

  -- Buyers cannot buy from their own farm
  IF v_listing.farm_id = current_farm_id() THEN
    RAISE EXCEPTION 'Cannot place an order on your own farm listing';
  END IF;

  -- Check available quantity
  IF p_quantity > v_listing.quantity_available THEN
    RAISE EXCEPTION 'Insufficient quantity. Available: %, Requested: %',
      v_listing.quantity_available, p_quantity;
  END IF;

  -- Get the batch for validation
  SELECT * INTO v_batch
  FROM production_batches
  WHERE id = v_listing.batch_id
  FOR UPDATE;

  IF v_batch.status NOT IN ('listed') THEN
    RAISE EXCEPTION 'Batch is no longer available (status: %)', v_batch.status;
  END IF;

  -- Check batch expiry
  IF v_batch.expiry_date IS NOT NULL AND v_batch.expiry_date < CURRENT_DATE THEN
    -- Mark as expired
    UPDATE production_batches SET status = 'expired' WHERE id = v_batch.id;
    UPDATE marketplace_listings SET is_active = false WHERE id = p_listing_id;
    RAISE EXCEPTION 'This product batch has expired';
  END IF;

  -- Compute line total server-side (NEVER trust client)
  v_line_total := v_listing.unit_price_minor * p_quantity;

  -- Generate order number
  v_order_number := generate_order_number();

  -- Create the order
  INSERT INTO orders (
    order_number, buyer_id, seller_farm_id, status,
    payment_method, subtotal_minor, total_amount_minor, currency,
    buyer_name, buyer_phone, delivery_address, delivery_notes
  ) VALUES (
    v_order_number, v_buyer_id, v_listing.farm_id, 'pending',
    p_payment_method, v_line_total, v_line_total, v_listing.currency,
    p_buyer_name, p_buyer_phone, p_delivery_address, p_delivery_notes
  )
  RETURNING id INTO v_order_id;

  -- Create the order item (snapshot all product details)
  INSERT INTO order_items (
    order_id, listing_id, batch_id,
    product_name, product_category, unit,
    quantity, unit_price_minor, line_total_minor, currency
  ) VALUES (
    v_order_id, p_listing_id, v_listing.batch_id,
    v_listing.title, v_listing.category, v_listing.unit,
    p_quantity, v_listing.unit_price_minor, v_line_total, v_listing.currency
  );

  -- Record initial status
  INSERT INTO order_status_history (order_id, new_status, changed_by)
  VALUES (v_order_id, 'pending', v_buyer_id);

  -- Create delivery info
  INSERT INTO delivery_info (order_id)
  VALUES (v_order_id);

  -- Decrement inventory
  UPDATE marketplace_listings
  SET quantity_available = quantity_available - p_quantity
  WHERE id = p_listing_id;

  UPDATE production_batches
  SET quantity_available = quantity_available - p_quantity
  WHERE id = v_listing.batch_id;

  -- If sold out, update statuses
  IF (v_listing.quantity_available - p_quantity) <= 0 THEN
    UPDATE marketplace_listings SET is_active = false WHERE id = p_listing_id;
    UPDATE production_batches SET status = 'sold_out' WHERE id = v_listing.batch_id;
  END IF;

  RETURN json_build_object(
    'order_id', v_order_id,
    'order_number', v_order_number,
    'total_minor', v_line_total,
    'currency', v_listing.currency
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

-- Update order status (seller admin only)
CREATE OR REPLACE FUNCTION update_order_status(
  p_order_id UUID,
  p_new_status marketplace_order_status,
  p_notes TEXT DEFAULT NULL
)
RETURNS JSON AS $$
DECLARE
  v_order orders%ROWTYPE;
BEGIN
  SELECT * INTO v_order FROM orders WHERE id = p_order_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Order not found';
  END IF;

  -- Only seller farm admin can update order status
  IF NOT is_farm_admin(v_order.seller_farm_id) THEN
    RAISE EXCEPTION 'Forbidden: only seller farm admin can update order status';
  END IF;

  -- Record the change
  INSERT INTO order_status_history (order_id, old_status, new_status, changed_by, notes)
  VALUES (p_order_id, v_order.status, p_new_status, auth.uid(), p_notes);

  -- Update the order
  UPDATE orders SET status = p_new_status WHERE id = p_order_id;

  -- Update delivery status based on order status
  IF p_new_status = 'ready_for_delivery' THEN
    UPDATE delivery_info SET status = 'pending' WHERE order_id = p_order_id;
  ELSIF p_new_status = 'out_for_delivery' THEN
    UPDATE delivery_info SET status = 'in_transit' WHERE order_id = p_order_id;
  ELSIF p_new_status = 'delivered' THEN
    UPDATE delivery_info
    SET status = 'delivered', delivered_at = now()
    WHERE order_id = p_order_id;
  ELSIF p_new_status = 'cancelled' THEN
    -- Restore inventory on cancellation
    UPDATE marketplace_listings ml
    SET quantity_available = ml.quantity_available + oi.quantity,
        is_active = true
    FROM order_items oi
    WHERE oi.order_id = p_order_id
      AND ml.id = oi.listing_id;

    UPDATE production_batches pb
    SET quantity_available = pb.quantity_available + oi.quantity,
        status = CASE WHEN pb.status = 'sold_out' THEN 'listed' ELSE pb.status END
    FROM order_items oi
    WHERE oi.order_id = p_order_id
      AND pb.id = oi.batch_id;
  END IF;

  RETURN json_build_object(
    'order_id', p_order_id,
    'old_status', v_order.status,
    'new_status', p_new_status
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

-- Update delivery info (seller admin only)
CREATE OR REPLACE FUNCTION update_delivery_info(
  p_order_id UUID,
  p_status delivery_status DEFAULT NULL,
  p_driver_name TEXT DEFAULT NULL,
  p_driver_phone TEXT DEFAULT NULL,
  p_estimated_delivery TIMESTAMPTZ DEFAULT NULL,
  p_notes TEXT DEFAULT NULL
)
RETURNS JSON AS $$
DECLARE
  v_order orders%ROWTYPE;
BEGIN
  SELECT * INTO v_order FROM orders WHERE id = p_order_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Order not found';
  END IF;

  IF NOT is_farm_admin(v_order.seller_farm_id) THEN
    RAISE EXCEPTION 'Forbidden: only seller farm admin can update delivery info';
  END IF;

  UPDATE delivery_info
  SET status = COALESCE(p_status, status),
      assigned_driver_name = COALESCE(p_driver_name, assigned_driver_name),
      assigned_driver_phone = COALESCE(p_driver_phone, assigned_driver_phone),
      estimated_delivery_at = COALESCE(p_estimated_delivery, estimated_delivery_at),
      delivery_notes = COALESCE(p_notes, delivery_notes),
      picked_up_at = CASE WHEN p_status = 'picked_up' THEN now() ELSE picked_up_at END,
      delivered_at = CASE WHEN p_status = 'delivered' THEN now() ELSE delivered_at END
  WHERE order_id = p_order_id;

  RETURN json_build_object('order_id', p_order_id, 'delivery_status', COALESCE(p_status, 'unchanged'));
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

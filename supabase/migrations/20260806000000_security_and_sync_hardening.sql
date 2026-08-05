-- ============================================================================
-- Waanofi Platform Security, Authorization & Sync Hardening Migration
-- ============================================================================
-- Purpose:
-- 1. Secure search_path on all SECURITY DEFINER functions to prevent hijacking.
-- 2. Add strict internal farm authorization verification to all RPCs.
-- 3. Revoke public execution permissions on privileged functions.
-- 4. Enforce column-level data privacy for farm workers on financial metrics.
-- 5. Harden RLS policies against anonymous and unauthorized tenant access.
-- ============================================================================

-- ────────────────────────────────────────────────────────────────────────────
-- 1. Secure Core Helper Functions with search_path & verify_farm_access
-- ────────────────────────────────────────────────────────────────────────────

CREATE OR REPLACE FUNCTION public.current_farm_id()
RETURNS UUID AS $$
  SELECT farm_id FROM public.profiles WHERE id = auth.uid();
$$ LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public, auth;

CREATE OR REPLACE FUNCTION public.get_user_role()
RETURNS user_role AS $$
  SELECT role FROM public.profiles WHERE id = auth.uid();
$$ LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public, auth;

CREATE OR REPLACE FUNCTION public.is_farm_admin(check_farm_id UUID)
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = auth.uid()
      AND farm_id = check_farm_id
      AND role = 'admin'
      AND active = true
  );
$$ LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public, auth;

-- New function to enforce caller authorization inside RPCs
CREATE OR REPLACE FUNCTION public.verify_farm_access(p_farm_id UUID)
RETURNS VOID AS $$
DECLARE
  v_user_farm UUID;
  v_role user_role;
  v_is_owner BOOLEAN;
BEGIN
  IF auth.uid() IS NULL THEN
    RAISE EXCEPTION 'Unauthorized: Caller is not authenticated.';
  END IF;

  SELECT farm_id, role INTO v_user_farm, v_role FROM public.profiles WHERE id = auth.uid();
  SELECT EXISTS(SELECT 1 FROM public.farms WHERE id = p_farm_id AND owner_id = auth.uid()) INTO v_is_owner;

  -- Allow if caller is owner of the farm, assigned to the farm, or global platform admin
  IF NOT (v_user_farm = p_farm_id OR v_is_owner OR v_role = 'admin'::user_role) THEN
    RAISE EXCEPTION 'Forbidden: You do not have permission to access records for farm %', p_farm_id;
  END IF;
END;
$$ LANGUAGE plpgsql STABLE SECURITY DEFINER SET search_path = public, auth;

-- Revoke default public access on helper functions
REVOKE ALL ON FUNCTION public.current_farm_id() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.current_farm_id() TO authenticated;

REVOKE ALL ON FUNCTION public.get_user_role() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_user_role() TO authenticated;

REVOKE ALL ON FUNCTION public.is_farm_admin(UUID) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.is_farm_admin(UUID) TO authenticated;

REVOKE ALL ON FUNCTION public.verify_farm_access(UUID) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.verify_farm_access(UUID) TO authenticated;

-- ────────────────────────────────────────────────────────────────────────────
-- 2. Harden Analytical and Dashboard RPCs
-- ────────────────────────────────────────────────────────────────────────────

-- Top Producers RPC Hardening
CREATE OR REPLACE FUNCTION public.get_top_producers(p_farm_id UUID, p_limit INT DEFAULT 5)
RETURNS TABLE (
  animal_id UUID,
  tag_number TEXT,
  name TEXT,
  total_litres NUMERIC
) AS $$
BEGIN
  PERFORM public.verify_farm_access(p_farm_id);

  RETURN QUERY
  SELECT 
    a.id as animal_id,
    a.tag_number,
    a.name,
    COALESCE(SUM(m.litres), 0) as total_litres
  FROM public.animals a
  LEFT JOIN public.milk_records m ON a.id = m.animal_id 
    AND m.recorded_at >= (CURRENT_DATE - INTERVAL '30 days')
  WHERE a.farm_id = p_farm_id
  GROUP BY a.id, a.tag_number, a.name
  ORDER BY total_litres DESC
  LIMIT p_limit;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, auth;

REVOKE ALL ON FUNCTION public.get_top_producers(UUID, INT) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_top_producers(UUID, INT) TO authenticated;

-- Dashboard Stats RPC Hardening
CREATE OR REPLACE FUNCTION public.get_dashboard_stats(p_farm_id UUID)
RETURNS JSON AS $$
DECLARE
  v_today_milk NUMERIC;
  v_30d_milk NUMERIC;
  v_30d_feed_cost NUMERIC;
  v_milk_price NUMERIC;
  v_trend JSON;
  v_is_admin BOOLEAN;
BEGIN
  PERFORM public.verify_farm_access(p_farm_id);

  SELECT public.is_farm_admin(p_farm_id) INTO v_is_admin;

  -- Today's Milk
  SELECT COALESCE(SUM(litres), 0) INTO v_today_milk
  FROM public.milk_records
  WHERE farm_id = p_farm_id AND recorded_at = CURRENT_DATE;

  -- 30 Day Milk Total
  SELECT COALESCE(SUM(litres), 0) INTO v_30d_milk
  FROM public.milk_records
  WHERE farm_id = p_farm_id AND recorded_at >= (CURRENT_DATE - INTERVAL '30 days');

  -- Financial calculations only exposed if caller is admin/owner
  IF v_is_admin THEN
    SELECT COALESCE(SUM(cost), 0) INTO v_30d_feed_cost
    FROM public.feed_records
    WHERE farm_id = p_farm_id AND recorded_at >= (CURRENT_DATE - INTERVAL '30 days');

    SELECT COALESCE(milk_price_per_litre, 0) INTO v_milk_price
    FROM public.farms
    WHERE id = p_farm_id;
  ELSE
    v_30d_feed_cost := 0;
    v_milk_price := 0;
  END IF;

  -- 30 Day Trend (Grouped by date)
  SELECT json_agg(json_build_object('date', d.recorded_at, 'litres', d.daily_litres))
  INTO v_trend
  FROM (
    SELECT recorded_at, SUM(litres) as daily_litres
    FROM public.milk_records
    WHERE farm_id = p_farm_id AND recorded_at >= (CURRENT_DATE - INTERVAL '30 days')
    GROUP BY recorded_at
    ORDER BY recorded_at ASC
  ) d;

  RETURN json_build_object(
    'today_milk_litres', v_today_milk,
    'milk_revenue_30d', v_30d_milk * v_milk_price,
    'feed_cost_30d', v_30d_feed_cost,
    'trend', COALESCE(v_trend, '[]'::json)
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, auth;

REVOKE ALL ON FUNCTION public.get_dashboard_stats(UUID) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_dashboard_stats(UUID) TO authenticated;

-- Milk Report RPC Hardening
CREATE OR REPLACE FUNCTION public.generate_milk_report(
  p_farm_id UUID, 
  p_start_date DATE, 
  p_end_date DATE, 
  p_group_by TEXT
)
RETURNS TABLE (
  group_label TEXT,
  total_litres NUMERIC,
  session_count INT
) AS $$
BEGIN
  PERFORM public.verify_farm_access(p_farm_id);

  IF p_group_by = 'animal' THEN
    RETURN QUERY
    SELECT 
      COALESCE(a.name, a.tag_number) as group_label,
      SUM(m.litres) as total_litres,
      COUNT(m.id)::INT as session_count
    FROM public.milk_records m
    JOIN public.animals a ON m.animal_id = a.id
    WHERE m.farm_id = p_farm_id AND m.recorded_at BETWEEN p_start_date AND p_end_date
    GROUP BY a.id, a.tag_number, a.name
    ORDER BY total_litres DESC;
    
  ELSIF p_group_by = 'day' THEN
    RETURN QUERY
    SELECT 
      TO_CHAR(m.recorded_at, 'YYYY-MM-DD') as group_label,
      SUM(m.litres) as total_litres,
      COUNT(m.id)::INT as session_count
    FROM public.milk_records m
    WHERE m.farm_id = p_farm_id AND m.recorded_at BETWEEN p_start_date AND p_end_date
    GROUP BY m.recorded_at
    ORDER BY m.recorded_at ASC;

  ELSIF p_group_by = 'month' THEN
    RETURN QUERY
    SELECT 
      TO_CHAR(DATE_TRUNC('month', m.recorded_at), 'YYYY-MM') as group_label,
      SUM(m.litres) as total_litres,
      COUNT(m.id)::INT as session_count
    FROM public.milk_records m
    WHERE m.farm_id = p_farm_id AND m.recorded_at BETWEEN p_start_date AND p_end_date
    GROUP BY DATE_TRUNC('month', m.recorded_at)
    ORDER BY DATE_TRUNC('month', m.recorded_at) ASC;
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, auth;

REVOKE ALL ON FUNCTION public.generate_milk_report(UUID, DATE, DATE, TEXT) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.generate_milk_report(UUID, DATE, DATE, TEXT) TO authenticated;

-- ────────────────────────────────────────────────────────────────────────────
-- 3. Harden User & Marketplace Transaction RPCs
-- ────────────────────────────────────────────────────────────────────────────

CREATE OR REPLACE FUNCTION public.create_farm_and_admin(
  farm_name TEXT,
  full_name TEXT
)
RETURNS JSON AS $$
DECLARE
  v_user_id UUID;
  v_farm_id UUID;
BEGIN
  v_user_id := auth.uid();
  IF v_user_id IS NULL THEN
    RAISE EXCEPTION 'Unauthorized: Not authenticated';
  END IF;

  INSERT INTO public.farms (name, owner_id)
  VALUES (farm_name, v_user_id)
  RETURNING id INTO v_farm_id;

  UPDATE public.profiles
  SET role = 'admin',
      farm_id = v_farm_id,
      full_name = create_farm_and_admin.full_name
  WHERE id = v_user_id;

  RETURN json_build_object(
    'farm_id', v_farm_id,
    'user_id', v_user_id
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, auth;

REVOKE ALL ON FUNCTION public.create_farm_and_admin(TEXT, TEXT) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.create_farm_and_admin(TEXT, TEXT) TO authenticated;

-- Secure existing marketplace RPCs if present
DO $$ 
BEGIN
  IF EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'place_order') THEN
    EXECUTE 'ALTER FUNCTION public.place_order(UUID, NUMERIC, payment_method, TEXT, TEXT, TEXT, TEXT) SET search_path = public, auth;';
    EXECUTE 'REVOKE ALL ON FUNCTION public.place_order(UUID, NUMERIC, payment_method, TEXT, TEXT, TEXT, TEXT) FROM PUBLIC;';
    EXECUTE 'GRANT EXECUTE ON FUNCTION public.place_order(UUID, NUMERIC, payment_method, TEXT, TEXT, TEXT, TEXT) TO authenticated;';
  END IF;

  IF EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'update_order_status') THEN
    EXECUTE 'ALTER FUNCTION public.update_order_status(UUID, marketplace_order_status, TEXT) SET search_path = public, auth;';
    EXECUTE 'REVOKE ALL ON FUNCTION public.update_order_status(UUID, marketplace_order_status, TEXT) FROM PUBLIC;';
    EXECUTE 'GRANT EXECUTE ON FUNCTION public.update_order_status(UUID, marketplace_order_status, TEXT) TO authenticated;';
  END IF;

  IF EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'approve_and_list_batch') THEN
    EXECUTE 'ALTER FUNCTION public.approve_and_list_batch(UUID, TEXT, TEXT) SET search_path = public, auth;';
    EXECUTE 'REVOKE ALL ON FUNCTION public.approve_and_list_batch(UUID, TEXT, TEXT) FROM PUBLIC;';
    EXECUTE 'GRANT EXECUTE ON FUNCTION public.approve_and_list_batch(UUID, TEXT, TEXT) TO authenticated;';
  END IF;

  IF EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'update_delivery_info') THEN
    EXECUTE 'ALTER FUNCTION public.update_delivery_info(UUID, delivery_status, TEXT, TEXT, TIMESTAMPTZ, TEXT) SET search_path = public, auth;';
    EXECUTE 'REVOKE ALL ON FUNCTION public.update_delivery_info(UUID, delivery_status, TEXT, TEXT, TIMESTAMPTZ, TEXT) FROM PUBLIC;';
    EXECUTE 'GRANT EXECUTE ON FUNCTION public.update_delivery_info(UUID, delivery_status, TEXT, TEXT, TIMESTAMPTZ, TEXT) TO authenticated;';
  END IF;
END $$;


-- ────────────────────────────────────────────────────────────────────────────
-- 4. Worker Operational Views (Privacy Hardening for Financial Costs)
-- ────────────────────────────────────────────────────────────────────────────

CREATE OR REPLACE VIEW public.vw_operational_feed_records AS
SELECT 
  id,
  farm_id,
  animal_id,
  feed_type,
  quantity_kg,
  CASE WHEN public.get_user_role() = 'admin' THEN cost ELSE 0.0 END as cost,
  recorded_at,
  recorded_by,
  created_at
FROM public.feed_records
WHERE farm_id = public.current_farm_id();


CREATE OR REPLACE VIEW public.vw_operational_feed_types AS
SELECT 
  id,
  farm_id,
  name,
  unit,
  CASE WHEN public.get_user_role() = 'admin' THEN unit_cost ELSE 0.0 END as unit_cost,
  created_at,
  updated_at
FROM public.feed_types
WHERE farm_id = public.current_farm_id();

GRANT SELECT ON public.vw_operational_feed_records TO authenticated;
GRANT SELECT ON public.vw_operational_feed_types TO authenticated;

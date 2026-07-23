-- 1. Add milk_price_per_litre to farms
ALTER TABLE farms ADD COLUMN IF NOT EXISTS milk_price_per_litre NUMERIC(10,2) NOT NULL DEFAULT 0.0;

-- 2. View: Animal Count by Status
CREATE OR REPLACE VIEW farm_animal_status_counts AS
SELECT 
  farm_id, 
  status, 
  COUNT(*) as count
FROM animals
GROUP BY farm_id, status;

-- 3. RPC: Top Producers
CREATE OR REPLACE FUNCTION get_top_producers(p_farm_id UUID, p_limit INT DEFAULT 5)
RETURNS TABLE (
  animal_id UUID,
  tag_number TEXT,
  name TEXT,
  total_litres NUMERIC
) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    a.id as animal_id,
    a.tag_number,
    a.name,
    COALESCE(SUM(m.litres), 0) as total_litres
  FROM animals a
  LEFT JOIN milk_records m ON a.id = m.animal_id 
    AND m.recorded_at >= (CURRENT_DATE - INTERVAL '30 days')
  WHERE a.farm_id = p_farm_id
  GROUP BY a.id, a.tag_number, a.name
  ORDER BY total_litres DESC
  LIMIT p_limit;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 4. RPC: Dashboard Stats (Returns JSON)
CREATE OR REPLACE FUNCTION get_dashboard_stats(p_farm_id UUID)
RETURNS JSON AS $$
DECLARE
  v_today_milk NUMERIC;
  v_30d_milk NUMERIC;
  v_30d_feed_cost NUMERIC;
  v_milk_price NUMERIC;
  v_trend JSON;
BEGIN
  -- Today's Milk
  SELECT COALESCE(SUM(litres), 0) INTO v_today_milk
  FROM milk_records
  WHERE farm_id = p_farm_id AND recorded_at = CURRENT_DATE;

  -- 30 Day Milk Total
  SELECT COALESCE(SUM(litres), 0) INTO v_30d_milk
  FROM milk_records
  WHERE farm_id = p_farm_id AND recorded_at >= (CURRENT_DATE - INTERVAL '30 days');

  -- 30 Day Feed Cost
  SELECT COALESCE(SUM(cost), 0) INTO v_30d_feed_cost
  FROM feed_records
  WHERE farm_id = p_farm_id AND recorded_at >= (CURRENT_DATE - INTERVAL '30 days');

  -- Milk Price
  SELECT milk_price_per_litre INTO v_milk_price
  FROM farms
  WHERE id = p_farm_id;

  -- 30 Day Trend (Grouped by date)
  SELECT json_agg(json_build_object('date', d.recorded_at, 'litres', d.daily_litres))
  INTO v_trend
  FROM (
    SELECT recorded_at, SUM(litres) as daily_litres
    FROM milk_records
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
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 5. RPC: Generate Milk Report
CREATE OR REPLACE FUNCTION generate_milk_report(
  p_farm_id UUID, 
  p_start_date DATE, 
  p_end_date DATE, 
  p_group_by TEXT -- 'animal', 'day', 'month'
)
RETURNS TABLE (
  group_label TEXT,
  total_litres NUMERIC,
  session_count INT
) AS $$
BEGIN
  IF p_group_by = 'animal' THEN
    RETURN QUERY
    SELECT 
      COALESCE(a.name, a.tag_number) as group_label,
      SUM(m.litres) as total_litres,
      COUNT(m.id)::INT as session_count
    FROM milk_records m
    JOIN animals a ON m.animal_id = a.id
    WHERE m.farm_id = p_farm_id AND m.recorded_at BETWEEN p_start_date AND p_end_date
    GROUP BY a.id, a.tag_number, a.name
    ORDER BY total_litres DESC;
    
  ELSIF p_group_by = 'day' THEN
    RETURN QUERY
    SELECT 
      TO_CHAR(m.recorded_at, 'YYYY-MM-DD') as group_label,
      SUM(m.litres) as total_litres,
      COUNT(m.id)::INT as session_count
    FROM milk_records m
    WHERE m.farm_id = p_farm_id AND m.recorded_at BETWEEN p_start_date AND p_end_date
    GROUP BY m.recorded_at
    ORDER BY m.recorded_at ASC;

  ELSIF p_group_by = 'month' THEN
    RETURN QUERY
    SELECT 
      TO_CHAR(DATE_TRUNC('month', m.recorded_at), 'YYYY-MM') as group_label,
      SUM(m.litres) as total_litres,
      COUNT(m.id)::INT as session_count
    FROM milk_records m
    WHERE m.farm_id = p_farm_id AND m.recorded_at BETWEEN p_start_date AND p_end_date
    GROUP BY DATE_TRUNC('month', m.recorded_at)
    ORDER BY DATE_TRUNC('month', m.recorded_at) ASC;
    
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

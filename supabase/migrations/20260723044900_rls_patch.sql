-- ═══════════════════════════════════════════════════════════════════
-- RLS PATCH — Run this after the tables already exist
-- Cleans up any partial policy state from previous failed runs.
-- ═══════════════════════════════════════════════════════════════════

-- ─────────────────────── Drop any existing policies ───────────────────────
DO $$ BEGIN
  -- farms
  DROP POLICY IF EXISTS farms_select ON farms;
  DROP POLICY IF EXISTS farms_insert ON farms;
  DROP POLICY IF EXISTS farms_update ON farms;
  DROP POLICY IF EXISTS farms_delete ON farms;
  -- profiles
  DROP POLICY IF EXISTS profiles_select ON profiles;
  DROP POLICY IF EXISTS profiles_update ON profiles;
  DROP POLICY IF EXISTS profiles_update_admin ON profiles;
  DROP POLICY IF EXISTS profiles_update_self ON profiles;
  DROP POLICY IF EXISTS profiles_delete ON profiles;
  -- animals
  DROP POLICY IF EXISTS animals_select ON animals;
  DROP POLICY IF EXISTS animals_insert ON animals;
  DROP POLICY IF EXISTS animals_update ON animals;
  DROP POLICY IF EXISTS animals_delete ON animals;
  -- feed_types
  DROP POLICY IF EXISTS feed_types_select ON feed_types;
  DROP POLICY IF EXISTS feed_types_insert ON feed_types;
  DROP POLICY IF EXISTS feed_types_update ON feed_types;
  DROP POLICY IF EXISTS feed_types_delete ON feed_types;
  -- milk_records
  DROP POLICY IF EXISTS milk_records_select ON milk_records;
  DROP POLICY IF EXISTS milk_records_select_staff ON milk_records;
  DROP POLICY IF EXISTS milk_records_select_guest ON milk_records;
  DROP POLICY IF EXISTS milk_records_insert ON milk_records;
  DROP POLICY IF EXISTS milk_records_update ON milk_records;
  DROP POLICY IF EXISTS milk_records_update_admin ON milk_records;
  DROP POLICY IF EXISTS milk_records_update_worker ON milk_records;
  DROP POLICY IF EXISTS milk_records_delete ON milk_records;
  DROP POLICY IF EXISTS milk_records_delete_admin ON milk_records;
  DROP POLICY IF EXISTS milk_records_delete_worker ON milk_records;
  -- feed_records
  DROP POLICY IF EXISTS feed_records_select ON feed_records;
  DROP POLICY IF EXISTS feed_records_insert ON feed_records;
  DROP POLICY IF EXISTS feed_records_update ON feed_records;
  DROP POLICY IF EXISTS feed_records_update_admin ON feed_records;
  DROP POLICY IF EXISTS feed_records_update_worker ON feed_records;
  DROP POLICY IF EXISTS feed_records_delete ON feed_records;
  DROP POLICY IF EXISTS feed_records_delete_admin ON feed_records;
  DROP POLICY IF EXISTS feed_records_delete_worker ON feed_records;
  -- triggers
  DROP TRIGGER IF EXISTS trg_feed_records_cost_guard ON feed_records;
END $$;

-- Drop old helper function name if it exists
DROP FUNCTION IF EXISTS auth_farm_id();

ALTER TABLE farms        ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles     ENABLE ROW LEVEL SECURITY;
ALTER TABLE animals      ENABLE ROW LEVEL SECURITY;
ALTER TABLE feed_types   ENABLE ROW LEVEL SECURITY;
ALTER TABLE milk_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE feed_records ENABLE ROW LEVEL SECURITY;

-- ─────────────────────── Helper functions ───────────────────────

CREATE OR REPLACE FUNCTION current_farm_id()
RETURNS UUID AS $$
  SELECT farm_id FROM profiles WHERE id = auth.uid();
$$ LANGUAGE sql STABLE SECURITY DEFINER;

CREATE OR REPLACE FUNCTION get_user_role()
RETURNS user_role AS $$
  SELECT role FROM profiles WHERE id = auth.uid();
$$ LANGUAGE sql STABLE SECURITY DEFINER;

CREATE OR REPLACE FUNCTION is_farm_admin(check_farm_id UUID)
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid()
      AND farm_id = check_farm_id
      AND role = 'admin'
      AND active = true
  );
$$ LANGUAGE sql STABLE SECURITY DEFINER;

-- ─────────────────────── Cost-zeroing trigger ───────────────────────

CREATE OR REPLACE FUNCTION enforce_cost_access()
RETURNS TRIGGER AS $$
BEGIN
  IF get_user_role() = 'user' THEN
    NEW.cost := 0;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER trg_feed_records_cost_guard
  BEFORE INSERT OR UPDATE ON feed_records
  FOR EACH ROW EXECUTE FUNCTION enforce_cost_access();

-- ─────────────────────── Aggregate view for guests ───────────────────────

CREATE OR REPLACE VIEW milk_daily_summary AS
SELECT
  farm_id,
  animal_id,
  recorded_at,
  SUM(litres)   AS total_litres,
  COUNT(*)      AS session_count
FROM milk_records
GROUP BY farm_id, animal_id, recorded_at;

-- ═══════════════════════════════════════════════════════════════════
-- POLICIES: farms
-- ═══════════════════════════════════════════════════════════════════

CREATE POLICY farms_select ON farms FOR SELECT
  USING (
    id = current_farm_id()
    OR owner_id = auth.uid()
  );

CREATE POLICY farms_insert ON farms FOR INSERT
  WITH CHECK (owner_id = auth.uid());

CREATE POLICY farms_update ON farms FOR UPDATE
  USING (owner_id = auth.uid())
  WITH CHECK (owner_id = auth.uid());

CREATE POLICY farms_delete ON farms FOR DELETE
  USING (owner_id = auth.uid());

-- ═══════════════════════════════════════════════════════════════════
-- POLICIES: profiles
-- ═══════════════════════════════════════════════════════════════════

CREATE POLICY profiles_select ON profiles FOR SELECT
  USING (
    id = auth.uid()
    OR (farm_id = current_farm_id() AND get_user_role() IN ('admin', 'user'))
  );

CREATE POLICY profiles_update_admin ON profiles FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY profiles_update_self ON profiles FOR UPDATE
  USING (id = auth.uid())
  WITH CHECK (
    (get_user_role() = 'admin') OR (role = get_user_role())
  );

CREATE POLICY profiles_delete ON profiles FOR DELETE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
    AND id != auth.uid()
  );

-- ═══════════════════════════════════════════════════════════════════
-- POLICIES: animals
-- ═══════════════════════════════════════════════════════════════════

CREATE POLICY animals_select ON animals FOR SELECT
  USING (farm_id = current_farm_id());

CREATE POLICY animals_insert ON animals FOR INSERT
  WITH CHECK (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY animals_update ON animals FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY animals_delete ON animals FOR DELETE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

-- ═══════════════════════════════════════════════════════════════════
-- POLICIES: feed_types
-- ═══════════════════════════════════════════════════════════════════

CREATE POLICY feed_types_select ON feed_types FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
  );

CREATE POLICY feed_types_insert ON feed_types FOR INSERT
  WITH CHECK (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY feed_types_update ON feed_types FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY feed_types_delete ON feed_types FOR DELETE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

-- ═══════════════════════════════════════════════════════════════════
-- POLICIES: milk_records
-- ═══════════════════════════════════════════════════════════════════

CREATE POLICY milk_records_select_staff ON milk_records FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
  );

CREATE POLICY milk_records_select_guest ON milk_records FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'guest'
  );

CREATE POLICY milk_records_insert ON milk_records FOR INSERT
  WITH CHECK (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
    AND recorded_by = auth.uid()
  );

CREATE POLICY milk_records_update_admin ON milk_records FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY milk_records_update_worker ON milk_records FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'user'
    AND recorded_by = auth.uid()
    AND created_at > now() - INTERVAL '24 hours'
  );

CREATE POLICY milk_records_delete_admin ON milk_records FOR DELETE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY milk_records_delete_worker ON milk_records FOR DELETE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'user'
    AND recorded_by = auth.uid()
    AND created_at > now() - INTERVAL '24 hours'
  );

-- ═══════════════════════════════════════════════════════════════════
-- POLICIES: feed_records
-- ═══════════════════════════════════════════════════════════════════

CREATE POLICY feed_records_select ON feed_records FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
  );

CREATE POLICY feed_records_insert ON feed_records FOR INSERT
  WITH CHECK (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
    AND recorded_by = auth.uid()
  );

CREATE POLICY feed_records_update_admin ON feed_records FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY feed_records_update_worker ON feed_records FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'user'
    AND recorded_by = auth.uid()
    AND created_at > now() - INTERVAL '24 hours'
  );

CREATE POLICY feed_records_delete_admin ON feed_records FOR DELETE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY feed_records_delete_worker ON feed_records FOR DELETE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'user'
    AND recorded_by = auth.uid()
    AND created_at > now() - INTERVAL '24 hours'
  );

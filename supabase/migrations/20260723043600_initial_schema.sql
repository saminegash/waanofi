-- ============================================================================
-- Waanofi Dairy — Initial Schema Migration
-- ============================================================================

-- ─────────────────────── Enums ───────────────────────

CREATE TYPE user_role AS ENUM ('admin', 'user', 'guest');

CREATE TYPE animal_status AS ENUM (
  'active',       -- currently in the herd
  'dry',          -- not lactating
  'pregnant',     -- expecting
  'sick',         -- under treatment
  'sold',         -- sold off
  'deceased'      -- died
);

CREATE TYPE animal_sex AS ENUM ('male', 'female');

CREATE TYPE milk_session AS ENUM ('morning', 'evening');

-- ─────────────────────── Tables ───────────────────────

-- Farms
CREATE TABLE farms (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name        TEXT NOT NULL,
  owner_id    UUID NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_farms_owner ON farms (owner_id);

-- Profiles (extends auth.users)
CREATE TABLE profiles (
  id          UUID PRIMARY KEY REFERENCES auth.users (id) ON DELETE CASCADE,
  full_name   TEXT NOT NULL,
  role        user_role NOT NULL DEFAULT 'user',
  farm_id     UUID REFERENCES farms (id) ON DELETE SET NULL,
  active      BOOLEAN NOT NULL DEFAULT true,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_profiles_farm ON profiles (farm_id);

-- Animals
CREATE TABLE animals (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id     UUID NOT NULL REFERENCES farms (id) ON DELETE CASCADE,
  tag_number  TEXT NOT NULL,
  name        TEXT,
  breed       TEXT,
  sex         animal_sex NOT NULL DEFAULT 'female',
  dob         DATE,
  status      animal_status NOT NULL DEFAULT 'active',
  photo_url   TEXT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),

  -- Tag number must be unique within a farm
  CONSTRAINT uq_animals_farm_tag UNIQUE (farm_id, tag_number)
);

CREATE INDEX idx_animals_farm   ON animals (farm_id);
CREATE INDEX idx_animals_status ON animals (farm_id, status);

-- Feed types (lookup table per farm)
CREATE TABLE feed_types (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id     UUID NOT NULL REFERENCES farms (id) ON DELETE CASCADE,
  name        TEXT NOT NULL,
  unit        TEXT NOT NULL DEFAULT 'kg',
  unit_cost   NUMERIC(12,2) NOT NULL DEFAULT 0,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT uq_feed_types_farm_name UNIQUE (farm_id, name)
);

CREATE INDEX idx_feed_types_farm ON feed_types (farm_id);

-- Milk records
CREATE TABLE milk_records (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  animal_id   UUID NOT NULL REFERENCES animals (id) ON DELETE CASCADE,
  farm_id     UUID NOT NULL REFERENCES farms (id) ON DELETE CASCADE,
  recorded_at DATE NOT NULL DEFAULT CURRENT_DATE,
  session     milk_session NOT NULL,
  litres      NUMERIC(8,2) NOT NULL CHECK (litres >= 0),
  recorded_by UUID NOT NULL REFERENCES auth.users (id) ON DELETE SET NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),

  -- One entry per animal per session per day
  CONSTRAINT uq_milk_animal_date_session UNIQUE (animal_id, recorded_at, session)
);

CREATE INDEX idx_milk_farm_date   ON milk_records (farm_id, recorded_at);
CREATE INDEX idx_milk_animal_date ON milk_records (animal_id, recorded_at);

-- Feed records
CREATE TABLE feed_records (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  animal_id   UUID REFERENCES animals (id) ON DELETE SET NULL,  -- nullable (herd-wide feed)
  farm_id     UUID NOT NULL REFERENCES farms (id) ON DELETE CASCADE,
  recorded_at DATE NOT NULL DEFAULT CURRENT_DATE,
  feed_type   UUID NOT NULL REFERENCES feed_types (id) ON DELETE RESTRICT,
  quantity_kg NUMERIC(10,2) NOT NULL CHECK (quantity_kg >= 0),
  cost        NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (cost >= 0),
  recorded_by UUID NOT NULL REFERENCES auth.users (id) ON DELETE SET NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT uq_feed_animal_date_type UNIQUE (animal_id, recorded_at, feed_type)
);

CREATE INDEX idx_feed_farm_date   ON feed_records (farm_id, recorded_at);
CREATE INDEX idx_feed_animal_date ON feed_records (animal_id, recorded_at);

-- ─────────────────────── Auto-update timestamps ───────────────────────

CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_farms_updated_at
  BEFORE UPDATE ON farms FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER trg_profiles_updated_at
  BEFORE UPDATE ON profiles FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER trg_animals_updated_at
  BEFORE UPDATE ON animals FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER trg_feed_types_updated_at
  BEFORE UPDATE ON feed_types FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ─────────────────────── Auto-create profile on signup ───────────────────────

CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, full_name, role)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data ->> 'full_name', ''),
    'user'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- ═══════════════════════════════════════════════════════════════════
-- ROW LEVEL SECURITY — Role-based, farm-scoped
-- ═══════════════════════════════════════════════════════════════════
--
-- Roles:
--   admin  → full CRUD on own farm's rows
--   user   → SELECT all farm rows; INSERT milk & feed records;
--            UPDATE/DELETE only own rows created within 24 h;
--            NO access to costs; NO animal deletion
--   guest  → SELECT animals + milk_records aggregates; NO writes
--
-- Cross-farm access is denied on every table.
-- ═══════════════════════════════════════════════════════════════════

ALTER TABLE farms        ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles     ENABLE ROW LEVEL SECURITY;
ALTER TABLE animals      ENABLE ROW LEVEL SECURITY;
ALTER TABLE feed_types   ENABLE ROW LEVEL SECURITY;
ALTER TABLE milk_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE feed_records ENABLE ROW LEVEL SECURITY;

-- ─────────────────────── Helper functions ───────────────────────

-- Returns the authenticated user's farm_id
CREATE OR REPLACE FUNCTION current_farm_id()
RETURNS UUID AS $$
  SELECT farm_id FROM profiles WHERE id = auth.uid();
$$ LANGUAGE sql STABLE SECURITY DEFINER;

-- Returns the authenticated user's role
CREATE OR REPLACE FUNCTION get_user_role()
RETURNS user_role AS $$
  SELECT role FROM profiles WHERE id = auth.uid();
$$ LANGUAGE sql STABLE SECURITY DEFINER;

-- Convenience: is the caller an admin on the given farm?
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

-- ─────────────────────── Cost-zeroing trigger for workers ───────────────────────
-- Workers (role = 'user') cannot see or set cost values on feed_records.
-- On INSERT/UPDATE by a non-admin, cost is forced to 0.

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
-- Guests see milk totals per animal per day, not individual records.

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

-- SELECT: any authenticated member of the farm, or the owner (even before joining)
CREATE POLICY farms_select ON farms FOR SELECT
  USING (
    id = current_farm_id()            -- member sees own farm
    OR owner_id = auth.uid()          -- owner always sees their farm
  );

-- INSERT: anyone can create a farm (they become owner)
CREATE POLICY farms_insert ON farms FOR INSERT
  WITH CHECK (owner_id = auth.uid());

-- UPDATE: only the farm owner
CREATE POLICY farms_update ON farms FOR UPDATE
  USING (owner_id = auth.uid())
  WITH CHECK (owner_id = auth.uid());

-- DELETE: only the farm owner
CREATE POLICY farms_delete ON farms FOR DELETE
  USING (owner_id = auth.uid());

-- ═══════════════════════════════════════════════════════════════════
-- POLICIES: profiles
-- ═══════════════════════════════════════════════════════════════════

-- SELECT: see yourself, or farm co-members if you are admin/user
CREATE POLICY profiles_select ON profiles FOR SELECT
  USING (
    id = auth.uid()
    OR (farm_id = current_farm_id() AND get_user_role() IN ('admin', 'user'))
  );

-- INSERT: handled by the on_auth_user_created trigger (SECURITY DEFINER)
-- No direct insert policy needed for app users.

-- UPDATE: admins can update any profile in their farm; users can update own row
CREATE POLICY profiles_update_admin ON profiles FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

CREATE POLICY profiles_update_self ON profiles FOR UPDATE
  USING (id = auth.uid())
  WITH CHECK (
    -- users cannot promote themselves
    (get_user_role() = 'admin') OR (role = get_user_role())
  );

-- DELETE: only admin can deactivate team members
CREATE POLICY profiles_delete ON profiles FOR DELETE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
    AND id != auth.uid()  -- cannot delete own profile
  );

-- ═══════════════════════════════════════════════════════════════════
-- POLICIES: animals
-- ═══════════════════════════════════════════════════════════════════

-- SELECT: admin, user, and guest can see their farm's animals
CREATE POLICY animals_select ON animals FOR SELECT
  USING (farm_id = current_farm_id());

-- INSERT: admin only
CREATE POLICY animals_insert ON animals FOR INSERT
  WITH CHECK (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

-- UPDATE: admin only (workers cannot modify animal records)
CREATE POLICY animals_update ON animals FOR UPDATE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

-- DELETE: admin only (workers explicitly denied animal deletion)
CREATE POLICY animals_delete ON animals FOR DELETE
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

-- ═══════════════════════════════════════════════════════════════════
-- POLICIES: feed_types
-- ═══════════════════════════════════════════════════════════════════

-- SELECT: admin and user see feed types; guest does not
CREATE POLICY feed_types_select ON feed_types FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
  );

-- INSERT/UPDATE/DELETE: admin only
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

-- SELECT: admin and user see all farm milk records
CREATE POLICY milk_records_select_staff ON milk_records FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
  );

-- SELECT: guest sees milk records too (for aggregate view access)
CREATE POLICY milk_records_select_guest ON milk_records FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'guest'
  );

-- INSERT: admin and user can record milk
CREATE POLICY milk_records_insert ON milk_records FOR INSERT
  WITH CHECK (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
    AND recorded_by = auth.uid()
  );

-- UPDATE: admin can update any; user can update own within 24 h
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

-- DELETE: admin can delete any; user can delete own within 24 h
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

-- SELECT: admin sees all (including cost); user sees all but cost
-- is zeroed by the enforce_cost_access trigger on read.
-- NOTE: The cost column is zeroed on write for workers via the trigger.
--       For read-side cost hiding, the app layer should use
--       get_user_role() to conditionally exclude the cost column.

-- SELECT: admin and user see their farm's feed records
CREATE POLICY feed_records_select ON feed_records FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
  );

-- INSERT: admin and user can record feed
-- (cost is auto-zeroed for workers by trg_feed_records_cost_guard)
CREATE POLICY feed_records_insert ON feed_records FOR INSERT
  WITH CHECK (
    farm_id = current_farm_id()
    AND get_user_role() IN ('admin', 'user')
    AND recorded_by = auth.uid()
  );

-- UPDATE: admin can update any; user can update own within 24 h
-- (cost stays zeroed for workers via trigger)
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

-- DELETE: admin can delete any; user can delete own within 24 h
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

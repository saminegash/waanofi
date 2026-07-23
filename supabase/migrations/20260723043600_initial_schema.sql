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
  INSERT INTO profiles (id, full_name, role)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data ->> 'full_name', ''),
    'user'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- ─────────────────────── Row Level Security ───────────────────────

ALTER TABLE farms        ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles     ENABLE ROW LEVEL SECURITY;
ALTER TABLE animals      ENABLE ROW LEVEL SECURITY;
ALTER TABLE feed_types   ENABLE ROW LEVEL SECURITY;
ALTER TABLE milk_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE feed_records ENABLE ROW LEVEL SECURITY;

-- Helper: get the authenticated user's farm_id
CREATE OR REPLACE FUNCTION auth_farm_id()
RETURNS UUID AS $$
  SELECT farm_id FROM profiles WHERE id = auth.uid();
$$ LANGUAGE sql STABLE SECURITY DEFINER;

-- Farms: owners see their farms; members see the farm they belong to
CREATE POLICY farms_select ON farms FOR SELECT
  USING (id = auth_farm_id() OR owner_id = auth.uid());

CREATE POLICY farms_insert ON farms FOR INSERT
  WITH CHECK (owner_id = auth.uid());

CREATE POLICY farms_update ON farms FOR UPDATE
  USING (owner_id = auth.uid());

CREATE POLICY farms_delete ON farms FOR DELETE
  USING (owner_id = auth.uid());

-- Profiles: users see co-members of the same farm; can update own row
CREATE POLICY profiles_select ON profiles FOR SELECT
  USING (farm_id = auth_farm_id() OR id = auth.uid());

CREATE POLICY profiles_update ON profiles FOR UPDATE
  USING (id = auth.uid());

-- Animals: farm-scoped
CREATE POLICY animals_select ON animals FOR SELECT
  USING (farm_id = auth_farm_id());

CREATE POLICY animals_insert ON animals FOR INSERT
  WITH CHECK (farm_id = auth_farm_id());

CREATE POLICY animals_update ON animals FOR UPDATE
  USING (farm_id = auth_farm_id());

CREATE POLICY animals_delete ON animals FOR DELETE
  USING (farm_id = auth_farm_id());

-- Feed types: farm-scoped
CREATE POLICY feed_types_select ON feed_types FOR SELECT
  USING (farm_id = auth_farm_id());

CREATE POLICY feed_types_insert ON feed_types FOR INSERT
  WITH CHECK (farm_id = auth_farm_id());

CREATE POLICY feed_types_update ON feed_types FOR UPDATE
  USING (farm_id = auth_farm_id());

CREATE POLICY feed_types_delete ON feed_types FOR DELETE
  USING (farm_id = auth_farm_id());

-- Milk records: farm-scoped
CREATE POLICY milk_records_select ON milk_records FOR SELECT
  USING (farm_id = auth_farm_id());

CREATE POLICY milk_records_insert ON milk_records FOR INSERT
  WITH CHECK (farm_id = auth_farm_id());

CREATE POLICY milk_records_update ON milk_records FOR UPDATE
  USING (farm_id = auth_farm_id());

CREATE POLICY milk_records_delete ON milk_records FOR DELETE
  USING (farm_id = auth_farm_id());

-- Feed records: farm-scoped
CREATE POLICY feed_records_select ON feed_records FOR SELECT
  USING (farm_id = auth_farm_id());

CREATE POLICY feed_records_insert ON feed_records FOR INSERT
  WITH CHECK (farm_id = auth_farm_id());

CREATE POLICY feed_records_update ON feed_records FOR UPDATE
  USING (farm_id = auth_farm_id());

CREATE POLICY feed_records_delete ON feed_records FOR DELETE
  USING (farm_id = auth_farm_id());

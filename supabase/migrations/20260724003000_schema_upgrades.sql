-- ============================================================================
-- Waanofi Dairy — Schema Upgrades
-- ============================================================================

-- 1. Add deleted_at to animals for soft deletes
ALTER TABLE animals ADD COLUMN deleted_at TIMESTAMPTZ;
CREATE INDEX idx_animals_deleted_at ON animals (farm_id, deleted_at);

-- 2. Modify milk_records.animal_id to ON DELETE RESTRICT
ALTER TABLE milk_records DROP CONSTRAINT milk_records_animal_id_fkey;

ALTER TABLE milk_records 
  ADD CONSTRAINT milk_records_animal_id_fkey 
  FOREIGN KEY (animal_id) 
  REFERENCES animals(id) 
  ON DELETE RESTRICT;

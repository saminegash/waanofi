-- 1. Create audit_logs table
CREATE TABLE audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  farm_id UUID NOT NULL REFERENCES farms (id) ON DELETE CASCADE,
  table_name TEXT NOT NULL,
  record_id UUID NOT NULL,
  action TEXT NOT NULL CHECK (action IN ('INSERT', 'UPDATE', 'DELETE')),
  old_data JSONB,
  new_data JSONB,
  changed_by UUID REFERENCES auth.users (id) ON DELETE SET NULL,
  changed_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Index for querying by farm
CREATE INDEX idx_audit_logs_farm ON audit_logs (farm_id, changed_at DESC);

-- 2. Audit trigger function
CREATE OR REPLACE FUNCTION audit_record_changes()
RETURNS TRIGGER AS $$
DECLARE
  v_farm_id UUID;
  v_old_data JSONB;
  v_new_data JSONB;
BEGIN
  -- Determine farm_id based on operation
  IF TG_OP = 'DELETE' THEN
    v_farm_id := OLD.farm_id;
    v_old_data := to_jsonb(OLD);
    v_new_data := NULL;
  ELSIF TG_OP = 'UPDATE' THEN
    v_farm_id := NEW.farm_id;
    v_old_data := to_jsonb(OLD);
    v_new_data := to_jsonb(NEW);
  ELSIF TG_OP = 'INSERT' THEN
    v_farm_id := NEW.farm_id;
    v_old_data := NULL;
    v_new_data := to_jsonb(NEW);
  END IF;

  -- Only insert log if data actually changed (for updates)
  IF TG_OP = 'UPDATE' AND v_old_data = v_new_data THEN
    RETURN NEW;
  END IF;

  INSERT INTO audit_logs (farm_id, table_name, record_id, action, old_data, new_data, changed_by)
  VALUES (
    v_farm_id,
    TG_TABLE_NAME,
    COALESCE(NEW.id, OLD.id),
    TG_OP,
    v_old_data,
    v_new_data,
    auth.uid()
  );

  IF TG_OP = 'DELETE' THEN
    RETURN OLD;
  ELSE
    RETURN NEW;
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 3. Attach triggers
CREATE TRIGGER trg_audit_milk_records
  AFTER INSERT OR UPDATE OR DELETE ON milk_records
  FOR EACH ROW EXECUTE FUNCTION audit_record_changes();

CREATE TRIGGER trg_audit_feed_records
  AFTER INSERT OR UPDATE OR DELETE ON feed_records
  FOR EACH ROW EXECUTE FUNCTION audit_record_changes();

-- 4. Enable RLS on audit_logs
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;

CREATE POLICY audit_logs_select ON audit_logs FOR SELECT
  USING (
    farm_id = current_farm_id()
    AND get_user_role() = 'admin'
  );

-- 5. Update get_user_role to enforce active status
CREATE OR REPLACE FUNCTION get_user_role()
RETURNS user_role AS $$
  SELECT role FROM profiles WHERE id = auth.uid() AND active = true;
$$ LANGUAGE sql STABLE SECURITY DEFINER;

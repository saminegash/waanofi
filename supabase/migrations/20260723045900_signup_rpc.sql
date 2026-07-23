-- ═══════════════════════════════════════════════════════════════════
-- Server-side sign-up helper (SECURITY DEFINER)
-- ═══════════════════════════════════════════════════════════════════
-- The RLS policies prevent a 'user' from changing their own role to
-- 'admin'. This function runs as the DB owner, bypassing RLS, so
-- the client sign-up flow can atomically create a farm + promote
-- the profile to admin.
-- ═══════════════════════════════════════════════════════════════════

CREATE OR REPLACE FUNCTION create_farm_and_admin(
  farm_name TEXT,
  full_name TEXT
)
RETURNS JSON AS $$
DECLARE
  v_user_id UUID;
  v_farm_id UUID;
BEGIN
  -- Get the calling user's ID
  v_user_id := auth.uid();
  IF v_user_id IS NULL THEN
    RAISE EXCEPTION 'Not authenticated';
  END IF;

  -- Create the farm
  INSERT INTO farms (name, owner_id)
  VALUES (farm_name, v_user_id)
  RETURNING id INTO v_farm_id;

  -- Promote the auto-created profile to admin + link to farm
  UPDATE profiles
  SET role = 'admin',
      farm_id = v_farm_id,
      full_name = create_farm_and_admin.full_name
  WHERE id = v_user_id;

  RETURN json_build_object(
    'farm_id', v_farm_id,
    'user_id', v_user_id
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ═══════════════════════════════════════════════════════════════════
-- Atomic Sign-up Trigger Fix
-- ═══════════════════════════════════════════════════════════════════
-- Creating the farm from the client immediately after signUp fails
-- if the JWT token hasn't propagated or if email confirmation is required.
-- 
-- Solution: we pass 'farm_name' in the user metadata during signUp,
-- and this trigger atomically creates both the profile AND the farm.
-- ═══════════════════════════════════════════════════════════════════

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
DECLARE
  v_farm_name TEXT;
  v_farm_id UUID;
BEGIN
  -- Extract farm_name if provided during sign-up
  v_farm_name := NEW.raw_user_meta_data ->> 'farm_name';
  
  -- 1. Create the default profile
  INSERT INTO public.profiles (id, full_name, role)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data ->> 'full_name', ''),
    'user'
  );

  -- 2. If farm_name was provided, create the farm and promote to admin
  IF v_farm_name IS NOT NULL AND BTRIM(v_farm_name) <> '' THEN
    INSERT INTO public.farms (name, owner_id)
    VALUES (v_farm_name, NEW.id)
    RETURNING id INTO v_farm_id;
    
    UPDATE public.profiles
    SET role = 'admin',
        farm_id = v_farm_id
    WHERE id = NEW.id;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

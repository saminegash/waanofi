-- ═══════════════════════════════════════════════════════════════════
-- Auth trigger fix
-- ═══════════════════════════════════════════════════════════════════
-- The Supabase Auth service runs in its own schema/role.
-- We must explicitly set the search_path to 'public' so the trigger 
-- can find our tables (like 'profiles') and enums (like 'user_role').
-- ═══════════════════════════════════════════════════════════════════

CREATE OR REPLACE FUNCTION public.handle_new_user()
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

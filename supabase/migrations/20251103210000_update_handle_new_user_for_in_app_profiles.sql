CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $function$
DECLARE
    v_profile_id UUID;
    v_profiles_manage_permission_id UUID;
BEGIN
  RAISE NOTICE 'Attempting to insert profile for user: %', NEW.id;

  -- Insert into public.profiles (existing logic)
  INSERT INTO public.profiles (
    id,
    first_name,
    last_name,
    role,
    company_name,
    company_vat_id,
    headquarters_name,
    headquarters_address
  )
  VALUES (
    NEW.id,
    NEW.raw_user_meta_data->>'first_name',
    NEW.raw_user_meta_data->>'last_name',
    NEW.raw_user_meta_data->>'role',
    NEW.raw_user_meta_data->>'company_name',
    NEW.raw_user_meta_data->>'company_vat_id',
    NEW.raw_user_meta_data->>'headquarters_name',
    NEW.raw_user_meta_data->>'headquarters_address'
  );
  RAISE NOTICE 'Profile inserted successfully into public.profiles for user: %', NEW.id;

  -- Create an in_app_profile for the new user
  INSERT INTO public.in_app_profiles (user_id, profile_name, position)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'first_name' || ' ' || NEW.raw_user_meta_data->>'last_name', NEW.email),
    'Proprietario' -- Default position for the initial owner profile
  )
  RETURNING id INTO v_profile_id;
  RAISE NOTICE 'In-app profile created with ID: % for user: %', v_profile_id, NEW.id;

  -- Assign 'profiles:manage' permission to the new in_app_profile
  SELECT id INTO v_profiles_manage_permission_id FROM public.permissions WHERE name = 'profiles:manage';

  IF v_profiles_manage_permission_id IS NOT NULL THEN
    INSERT INTO public.profile_permissions (profile_id, permission_id)
    VALUES (v_profile_id, v_profiles_manage_permission_id);
    RAISE NOTICE 'Assigned profiles:manage permission to in-app profile: %', v_profile_id;
  ELSE
    RAISE WARNING 'Permission "profiles:manage" not found. Cannot assign to new in-app profile.';
  END IF;

  RETURN NEW;
EXCEPTION
  WHEN OTHERS THEN
    RAISE NOTICE 'Error in handle_new_user for user %: %', NEW.id, SQLERRM;
    RETURN NEW;
END;
$function$;
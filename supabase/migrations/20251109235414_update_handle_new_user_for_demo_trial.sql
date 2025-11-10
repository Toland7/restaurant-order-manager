CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $function$
DECLARE
    v_profile_id UUID;
    v_profiles_manage_permission_id UUID;
    v_company_id UUID;
BEGIN
  RAISE NOTICE 'Attempting to insert profile for user: %', NEW.id;

  -- Create a new company entry with demo tier and trial dates
  INSERT INTO public.companies (owner_id, name, vat_id, address, subscription_tier, trial_start_date, trial_end_date)
  VALUES (
    NEW.id,
    NEW.raw_user_meta_data->>'company_name',
    NEW.raw_user_meta_data->>'company_vat_id',
    NEW.raw_user_meta_data->>'headquarters_address',
    'demo', -- Set subscription_tier to 'demo' for new users
    NOW(),  -- Set trial_start_date to current timestamp
    NOW() + INTERVAL '30 days' -- Set trial_end_date to 30 days from now
  )
  RETURNING id INTO v_company_id;
  RAISE NOTICE 'Company created with ID: % for user: % (Demo Tier)', v_company_id, NEW.id;

    -- Insert into public.profiles (existing logic, now linked to company)
    INSERT INTO public.profiles (
      id,
      first_name,
      last_name,
      role,
      company_id
    )
    VALUES (
      NEW.id,
      NEW.raw_user_meta_data->>'first_name',
      NEW.raw_user_meta_data->>'last_name',
      NEW.raw_user_meta_data->>'role',
      v_company_id
    );
    RAISE NOTICE 'Profile inserted successfully into public.profiles for user: %', NEW.id;

    -- Create an in_app_profile for the new user (now linked to company)
    INSERT INTO public.in_app_profiles (user_id, profile_name, position, company_id)
    VALUES (
      NEW.id,
      COALESCE(NEW.raw_user_meta_data->>'first_name' || ' ' || NEW.raw_user_meta_data->>'last_name', NEW.email),
      'Proprietario', -- Default position for the initial owner profile
      v_company_id
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
-- Migration: 202511150000_update_handle_new_user_create_inapp_profile.sql
-- This migration updates the existing handle_new_user trigger so that every new user (demo, base, pro) gets an in_app_profile.
-- Permissions are assigned based on the subscription tier.

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO ''
AS $function$
DECLARE
    v_profile_id UUID;
    v_company_id UUID;
    v_permission_id UUID;
    v_profiles_manage_permission_id UUID;
BEGIN
    -- Create a new company entry (demo, base or pro)
    INSERT INTO public.companies (
        owner_id,
        name,
        vat_id,
        address,
        subscription_tier,
        trial_start_date,
        trial_end_date
    ) VALUES (
        NEW.id,
        NEW.raw_user_meta_data->>'company_name',
        NEW.raw_user_meta_data->>'company_vat_id',
        NEW.raw_user_meta_data->>'headquarters_address',
        COALESCE(NEW.raw_user_meta_data->>'subscription_tier', 'demo'), -- default to demo
        CASE WHEN COALESCE(NEW.raw_user_meta_data->>'subscription_tier', 'demo') = 'demo'
            THEN NOW()
            ELSE NULL END,
        CASE WHEN COALESCE(NEW.raw_user_meta_data->>'subscription_tier', 'demo') = 'demo'
            THEN NOW() + INTERVAL '30 days'
            ELSE NULL END
    ) RETURNING id INTO v_company_id;

    -- Insert into public.profiles (basic user info)
    INSERT INTO public.profiles (
        id,
        first_name,
        last_name,
        role,
        company_id
    ) VALUES (
        NEW.id,
        NEW.raw_user_meta_data->>'first_name',
        NEW.raw_user_meta_data->>'last_name',
        NEW.raw_user_meta_data->>'role',
        v_company_id
    );

    -- Create the in_app_profile (always created)
    INSERT INTO public.in_app_profiles (
        user_id,
        profile_name,
        position,
        company_id
    ) VALUES (
        NEW.id,
        COALESCE(
            NEW.raw_user_meta_data->>'first_name' || ' ' || NEW.raw_user_meta_data->>'last_name',
            NEW.email
        ),
        'Proprietario',
        v_company_id
    ) RETURNING id INTO v_profile_id;

    -- Assign permissions based on tier
    IF COALESCE(NEW.raw_user_meta_data->>'subscription_tier', 'demo') = 'pro' THEN
        -- Pro: all permissions including profiles:manage
        FOR v_permission_id IN SELECT id FROM public.permissions LOOP
            INSERT INTO public.profile_permissions (profile_id, permission_id)
            VALUES (v_profile_id, v_permission_id);
        END LOOP;
    ELSE
        -- Demo or Base: all permissions except profiles:manage
        FOR v_permission_id IN SELECT id FROM public.permissions WHERE name <> 'profiles:manage' LOOP
            INSERT INTO public.profile_permissions (profile_id, permission_id)
            VALUES (v_profile_id, v_permission_id);
        END LOOP;
    END IF;

    RETURN NEW;
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error in handle_new_user for user %: %', NEW.id, SQLERRM;
        RETURN NEW;
END;
$function$;

-- Re‑attach the trigger to the auth.users table (if not already attached)
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

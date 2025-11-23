-- Migration: 202511150001_backfill_existing_users_permissions.sql
-- This migration ensures all existing users with demo/base tier have all permissions except profiles:manage

DO $$
DECLARE
    v_profile RECORD;
    v_permission RECORD;
    v_existing_permission INT;
BEGIN
    -- Loop through all in_app_profiles where the company tier is demo or base
    FOR v_profile IN 
        SELECT iap.id AS profile_id, c.subscription_tier
        FROM public.in_app_profiles iap
        JOIN public.companies c ON iap.company_id = c.id
        WHERE c.subscription_tier IN ('demo', 'base')
    LOOP
        -- For each permission (except profiles:manage), ensure it exists
        FOR v_permission IN 
            SELECT id FROM public.permissions WHERE name <> 'profiles:manage'
        LOOP
            -- Check if permission already exists
            SELECT COUNT(*) INTO v_existing_permission
            FROM public.profile_permissions
            WHERE profile_id = v_profile.profile_id 
              AND permission_id = v_permission.id;
            
            -- Insert if not exists
            IF v_existing_permission = 0 THEN
                INSERT INTO public.profile_permissions (profile_id, permission_id)
                VALUES (v_profile.profile_id, v_permission.id);
                RAISE NOTICE 'Added permission % to profile %', v_permission.id, v_profile.profile_id;
            END IF;
        END LOOP;
    END LOOP;
END $$;

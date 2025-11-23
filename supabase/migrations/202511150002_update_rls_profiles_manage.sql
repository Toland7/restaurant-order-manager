-- Migration: 202511150002_update_rls_profiles_manage.sql
-- This migration updates RLS policies to ensure profiles:manage is only available for Pro users

-- Drop existing policies on profile_permissions if they exist
DROP POLICY IF EXISTS "Users can view their own profile permissions" ON public.profile_permissions;
DROP POLICY IF EXISTS "Users can insert their own profile permissions" ON public.profile_permissions;
DROP POLICY IF EXISTS "Users can update their own profile permissions" ON public.profile_permissions;
DROP POLICY IF EXISTS "Users can delete their own profile permissions" ON public.profile_permissions;

-- Allow all users to view their profile permissions
CREATE POLICY "Users can view their own profile permissions"
ON public.profile_permissions FOR SELECT
USING (
    profile_id IN (
        SELECT id FROM public.in_app_profiles
        WHERE user_id = auth.uid()
    )
);

-- Allow only Pro users to insert profiles:manage permission
CREATE POLICY "Pro users can insert profile permissions"
ON public.profile_permissions FOR INSERT
WITH CHECK (
    -- Check if user is Pro (has profiles:manage or tier = 'pro')
    EXISTS (
        SELECT 1 FROM public.in_app_profiles iap
        JOIN public.companies c ON iap.company_id = c.id
        WHERE iap.user_id = auth.uid()
          AND c.subscription_tier = 'pro'
    )
    OR
    -- Allow inserting any permission except profiles:manage for non-Pro users
    (
        permission_id NOT IN (SELECT id FROM public.permissions WHERE name = 'profiles:manage')
        AND profile_id IN (SELECT id FROM public.in_app_profiles WHERE user_id = auth.uid())
    )
);

-- Allow only Pro users to update/delete profiles:manage permission
CREATE POLICY "Pro users can update profile permissions"
ON public.profile_permissions FOR UPDATE
USING (
    EXISTS (
        SELECT 1 FROM public.in_app_profiles iap
        JOIN public.companies c ON iap.company_id = c.id
        WHERE iap.user_id = auth.uid()
          AND c.subscription_tier = 'pro'
    )
);

CREATE POLICY "Pro users can delete profile permissions"
ON public.profile_permissions FOR DELETE
USING (
    EXISTS (
        SELECT 1 FROM public.in_app_profiles iap
        JOIN public.companies c ON iap.company_id = c.id
        WHERE iap.user_id = auth.uid()
          AND c.subscription_tier = 'pro'
    )
);

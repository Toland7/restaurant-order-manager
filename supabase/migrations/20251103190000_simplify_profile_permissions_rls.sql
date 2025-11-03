-- Drop the existing RLS policies for profile_permissions
DROP POLICY IF EXISTS "Allow profiles:manage users to insert their own profile permissions" ON public.profile_permissions;
DROP POLICY IF EXISTS "Allow profiles:manage users to update their own profile permissions" ON public.profile_permissions;
DROP POLICY IF EXISTS "Allow profiles:manage users to delete their own profile permissions" ON public.profile_permissions;

-- Drop the security definer function
DROP FUNCTION IF EXISTS public.has_profiles_manage_permission();

-- RLS Policy for INSERT on profile_permissions
CREATE POLICY "Allow users to insert permissions for their own profiles" ON public.profile_permissions FOR INSERT WITH CHECK (
    EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
);

-- RLS Policy for UPDATE on profile_permissions
CREATE POLICY "Allow users to update permissions for their own profiles" ON public.profile_permissions FOR UPDATE USING (
    EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
) WITH CHECK (
    EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
);

-- RLS Policy for DELETE on profile_permissions
CREATE POLICY "Allow users to delete permissions for their own profiles" ON public.profile_permissions FOR DELETE USING (
    EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
);
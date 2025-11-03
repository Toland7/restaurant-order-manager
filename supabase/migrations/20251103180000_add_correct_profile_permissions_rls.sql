-- Create a security definer function to check if the current user has 'profiles:manage' permission
CREATE OR REPLACE FUNCTION public.has_profiles_manage_permission()
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER -- This makes the function run with the privileges of the user who created it (e.g., postgres)
SET search_path = public, pg_temp
AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1
    FROM public.profile_permissions pp
    JOIN public.permissions p ON pp.permission_id = p.id
    JOIN public.in_app_profiles iap ON pp.profile_id = iap.id
    WHERE iap.user_id = auth.uid()
      AND p.name = 'profiles:manage'
  );
END;
$$;

-- Grant execute on the function to authenticated users
GRANT EXECUTE ON FUNCTION public.has_profiles_manage_permission() TO authenticated;

-- RLS Policy for INSERT on profile_permissions
CREATE POLICY "Allow profiles:manage users to insert their own profile permissions" ON public.profile_permissions FOR INSERT WITH CHECK (
    public.has_profiles_manage_permission()
    AND EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
);

-- RLS Policy for UPDATE on profile_permissions
CREATE POLICY "Allow profiles:manage users to update their own profile permissions" ON public.profile_permissions FOR UPDATE USING (
    public.has_profiles_manage_permission()
    AND EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
) WITH CHECK (
    public.has_profiles_manage_permission()
    AND EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
);

-- RLS Policy for DELETE on profile_permissions
CREATE POLICY "Allow profiles:manage users to delete their own profile permissions" ON public.profile_permissions FOR DELETE USING (
    public.has_profiles_manage_permission()
    AND EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
);
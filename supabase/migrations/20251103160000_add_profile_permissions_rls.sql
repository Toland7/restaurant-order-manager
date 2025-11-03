-- RLS Policy for INSERT on profile_permissions
CREATE POLICY "Allow profiles:manage users to insert their own profile permissions" ON public.profile_permissions FOR INSERT WITH CHECK (
    EXISTS (
        SELECT 1
        FROM public.profile_permissions pp_check
        JOIN public.permissions perm_check ON pp_check.permission_id = perm_check.id
        JOIN public.in_app_profiles iap_check ON pp_check.profile_id = iap_check.id
        WHERE iap_check.user_id = auth.uid()
          AND perm_check.name = 'profiles:manage'
    )
    AND EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid()) -- Ensure they are managing their own profile's permissions
);

-- RLS Policy for UPDATE on profile_permissions
CREATE POLICY "Allow profiles:manage users to update their own profile permissions" ON public.profile_permissions FOR UPDATE USING (
    EXISTS (
        SELECT 1
        FROM public.profile_permissions pp_check
        JOIN public.permissions perm_check ON pp_check.permission_id = perm_check.id
        JOIN public.in_app_profiles iap_check ON pp_check.profile_id = iap_check.id
        WHERE iap_check.user_id = auth.uid()
          AND perm_check.name = 'profiles:manage'
    )
    AND EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
) WITH CHECK (
    EXISTS (
        SELECT 1
        FROM public.profile_permissions pp_check
        JOIN public.permissions perm_check ON pp_check.permission_id = perm_check.id
        JOIN public.in_app_profiles iap_check ON pp_check.profile_id = iap_check.id
        WHERE iap_check.user_id = auth.uid()
          AND perm_check.name = 'profiles:manage'
    )
    AND EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
);

-- RLS Policy for DELETE on profile_permissions
CREATE POLICY "Allow profiles:manage users to delete their own profile permissions" ON public.profile_permissions FOR DELETE USING (
    EXISTS (
        SELECT 1
        FROM public.profile_permissions pp_check
        JOIN public.permissions perm_check ON pp_check.permission_id = perm_check.id
        JOIN public.in_app_profiles iap_check ON pp_check.profile_id = iap_check.id
        WHERE iap_check.user_id = auth.uid()
          AND perm_check.name = 'profiles:manage'
    )
    AND EXISTS (SELECT 1 FROM public.in_app_profiles WHERE id = profile_id AND user_id = auth.uid())
);
-- Add 'profiles:manage' permission to all existing in_app_profiles
INSERT INTO public.profile_permissions (profile_id, permission_id)
SELECT
    iap.id,
    (SELECT id FROM public.permissions WHERE name = 'profiles:manage')
FROM
    public.in_app_profiles iap
WHERE
    NOT EXISTS (
        SELECT 1
        FROM public.profile_permissions pp
        WHERE pp.profile_id = iap.id
        AND pp.permission_id = (SELECT id FROM public.permissions WHERE name = 'profiles:manage')
    );
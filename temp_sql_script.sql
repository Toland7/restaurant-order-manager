INSERT INTO public.in_app_profiles (user_id, profile_name, role)
SELECT
    p.id,
    COALESCE(p.first_name || ' ' || p.last_name, u.email),
    'OWNER'::public.role
FROM
    public.profiles p
JOIN
    auth.users u ON p.id = u.id
WHERE
    NOT EXISTS (SELECT 1 FROM public.in_app_profiles WHERE user_id = p.id);
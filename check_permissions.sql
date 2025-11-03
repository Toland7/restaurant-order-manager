-- Run this INSERT statement first:
INSERT INTO public.profile_permissions (profile_id, permission_id)
SELECT
    '147715a0-d234-459a-933a-483244a26776', -- Your profile_id
    id                                      -- The id of 'profiles:manage' permission
FROM
    public.permissions
WHERE
    name = 'profiles:manage'
ON CONFLICT (profile_id, permission_id) DO NOTHING; -- Avoids error if already exists

-- After running the INSERT, run this SELECT query and provide its result:
SELECT
    pp.profile_id,
    p.name AS permission_name,
    p.description AS permission_description
FROM
    public.profile_permissions pp
JOIN
    public.permissions p ON pp.permission_id = p.id
WHERE
    pp.profile_id = '147715a0-d234-459a-933a-483244a26776';
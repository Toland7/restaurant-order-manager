-- Emergency fix: Assign ALL permissions to ALL existing in_app_profiles
-- This ensures all users can access the system in Staging
-- Permissions can be managed manually later via the UI

INSERT INTO public.profile_permissions (profile_id, permission_id)
SELECT 
  iap.id as profile_id,
  p.id as permission_id
FROM 
  public.in_app_profiles iap
CROSS JOIN 
  public.permissions p
WHERE NOT EXISTS (
  SELECT 1 FROM public.profile_permissions pp
  WHERE pp.profile_id = iap.id AND pp.permission_id = p.id
)
ON CONFLICT DO NOTHING;

-- Remove the RLS policies that caused infinite recursion
DROP POLICY IF EXISTS "Allow profiles:manage users to insert their own profile permissions" ON public.profile_permissions;
DROP POLICY IF EXISTS "Allow profiles:manage users to update their own profile permissions" ON public.profile_permissions;
DROP POLICY IF EXISTS "Allow profiles:manage users to delete their own profile permissions" ON public.profile_permissions;
-- Enable RLS on in_app_profiles and profile_permissions
ALTER TABLE "public"."in_app_profiles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "public"."profile_permissions" ENABLE ROW LEVEL SECURITY;

-- Policy for in_app_profiles
DROP POLICY IF EXISTS "in_app_profiles_all_policy" ON "public"."in_app_profiles";
CREATE POLICY "in_app_profiles_all_policy" ON "public"."in_app_profiles" 
USING (user_id = auth.uid());

-- Policies for profile_permissions
DROP POLICY IF EXISTS "profile_permissions_select_policy" ON "public"."profile_permissions";
CREATE POLICY "profile_permissions_select_policy" ON "public"."profile_permissions" 
FOR SELECT USING (
  profile_id IN (
    SELECT id FROM public.in_app_profiles 
    WHERE user_id = auth.uid()
  )
);

DROP POLICY IF EXISTS "profile_permissions_insert_policy" ON "public"."profile_permissions";
CREATE POLICY "profile_permissions_insert_policy" ON "public"."profile_permissions" 
FOR INSERT WITH CHECK (
  (profile_id IN (
    SELECT id FROM public.in_app_profiles 
    WHERE user_id = auth.uid()
  )) 
  OR 
  (EXISTS (
    SELECT 1 FROM public.profiles p
    JOIN public.companies c ON p.company_id = c.id
    WHERE p.id = auth.uid() AND c.subscription_tier = 'pro'
  ))
);

DROP POLICY IF EXISTS "profile_permissions_update_policy" ON "public"."profile_permissions";
CREATE POLICY "profile_permissions_update_policy" ON "public"."profile_permissions" 
FOR UPDATE USING (
  (profile_id IN (
    SELECT id FROM public.in_app_profiles 
    WHERE user_id = auth.uid()
  )) 
  OR 
  (EXISTS (
    SELECT 1 FROM public.profiles p
    JOIN public.companies c ON p.company_id = c.id
    WHERE p.id = auth.uid() AND c.subscription_tier = 'pro'
  ))
);

DROP POLICY IF EXISTS "profile_permissions_delete_policy" ON "public"."profile_permissions";
CREATE POLICY "profile_permissions_delete_policy" ON "public"."profile_permissions" 
FOR DELETE USING (
  (profile_id IN (
    SELECT id FROM public.in_app_profiles 
    WHERE user_id = auth.uid()
  )) 
  OR 
  (EXISTS (
    SELECT 1 FROM public.profiles p
    JOIN public.companies c ON p.company_id = c.id
    WHERE p.id = auth.uid() AND c.subscription_tier = 'pro'
  ))
);

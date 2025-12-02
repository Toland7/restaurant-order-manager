-- Migration: Fix Auth RLS InitPlan for all tables
-- Date: 2025-12-01
-- Description: Optimizes RLS policies by wrapping auth functions in SELECT subqueries
--              to prevent re-evaluation for each row.
-- Reference: https://supabase.com/docs/guides/database/postgres/row-level-security#call-functions-with-select

-- ============================================================================
-- SUPPLIERS TABLE
-- ============================================================================

DROP POLICY IF EXISTS "Users can delete own suppliers" ON public.suppliers;
CREATE POLICY "Users can delete own suppliers" ON public.suppliers
FOR DELETE USING (user_id = (SELECT auth.uid()));

-- ============================================================================
-- SCHEDULED_ORDERS TABLE
-- ============================================================================

DROP POLICY IF EXISTS "Users can view own scheduled orders" ON public.scheduled_orders;
CREATE POLICY "Users can view own scheduled orders" ON public.scheduled_orders
FOR SELECT USING (user_id = (SELECT auth.uid()));

-- ============================================================================
-- NOTIFICATIONS TABLE
-- ============================================================================

DROP POLICY IF EXISTS "Admins can view all notifications" ON public.notifications;
CREATE POLICY "Admins can view all notifications" ON public.notifications
FOR SELECT USING (
  EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = (SELECT auth.uid())
    AND role = 'admin'
  )
);

DROP POLICY IF EXISTS "Users can view own notifications" ON public.notifications;
CREATE POLICY "Users can view own notifications" ON public.notifications
FOR SELECT USING (user_id = (SELECT auth.uid()));

-- ============================================================================
-- PROFILES TABLE
-- ============================================================================

DROP POLICY IF EXISTS "Admins can manage all profiles" ON public.profiles;
CREATE POLICY "Admins can manage all profiles" ON public.profiles
FOR ALL USING (
  EXISTS (
    SELECT 1 FROM public.profiles p
    WHERE p.id = (SELECT auth.uid())
    AND p.role = 'admin'
  )
);

DROP POLICY IF EXISTS "Users can delete their own profile" ON public.profiles;
CREATE POLICY "Users can delete their own profile" ON public.profiles
FOR DELETE USING (id = (SELECT auth.uid()));

DROP POLICY IF EXISTS "Users can insert their own profile" ON public.profiles;
CREATE POLICY "Users can insert their own profile" ON public.profiles
FOR INSERT WITH CHECK (id = (SELECT auth.uid()));

DROP POLICY IF EXISTS "Users can update their own profile" ON public.profiles;
CREATE POLICY "Users can update their own profile" ON public.profiles
FOR UPDATE USING (id = (SELECT auth.uid()));

DROP POLICY IF EXISTS "Users can view their own profile" ON public.profiles;
CREATE POLICY "Users can view their own profile" ON public.profiles
FOR SELECT USING (id = (SELECT auth.uid()));

-- ============================================================================
-- IN_APP_PROFILES TABLE
-- ============================================================================

DROP POLICY IF EXISTS "Allow users to manage their in-app profiles" ON public.in_app_profiles;
CREATE POLICY "Allow users to manage their in-app profiles" ON public.in_app_profiles
FOR ALL USING (user_id = (SELECT auth.uid()));

DROP POLICY IF EXISTS "Allow users to read their own in-app profiles" ON public.in_app_profiles;
CREATE POLICY "Allow users to read their own in-app profiles" ON public.in_app_profiles
FOR SELECT USING (user_id = (SELECT auth.uid()));

-- ============================================================================
-- PROFILE_PERMISSIONS TABLE
-- ============================================================================

DROP POLICY IF EXISTS "Allow users to delete permissions for their own profiles" ON public.profile_permissions;
CREATE POLICY "Allow users to delete permissions for their own profiles" ON public.profile_permissions
FOR DELETE USING (
  profile_id IN (
    SELECT id FROM public.in_app_profiles
    WHERE user_id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "Allow users to insert permissions for their own profiles" ON public.profile_permissions;
CREATE POLICY "Allow users to insert permissions for their own profiles" ON public.profile_permissions
FOR INSERT WITH CHECK (
  profile_id IN (
    SELECT id FROM public.in_app_profiles
    WHERE user_id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "Allow users to read their own profile permissions" ON public.profile_permissions;
CREATE POLICY "Allow users to read their own profile permissions" ON public.profile_permissions
FOR SELECT USING (
  profile_id IN (
    SELECT id FROM public.in_app_profiles
    WHERE user_id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "Allow users to update permissions for their own profiles" ON public.profile_permissions;
CREATE POLICY "Allow users to update permissions for their own profiles" ON public.profile_permissions
FOR UPDATE USING (
  profile_id IN (
    SELECT id FROM public.in_app_profiles
    WHERE user_id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "Pro users can delete profile permissions" ON public.profile_permissions;
CREATE POLICY "Pro users can delete profile permissions" ON public.profile_permissions
FOR DELETE USING (
  EXISTS (
    SELECT 1 FROM public.profiles p
    JOIN public.companies c ON p.company_id = c.id
    WHERE p.id = (SELECT auth.uid())
    AND c.subscription_tier = 'pro'
  )
);

DROP POLICY IF EXISTS "Pro users can insert profile permissions" ON public.profile_permissions;
CREATE POLICY "Pro users can insert profile permissions" ON public.profile_permissions
FOR INSERT WITH CHECK (
  EXISTS (
    SELECT 1 FROM public.profiles p
    JOIN public.companies c ON p.company_id = c.id
    WHERE p.id = (SELECT auth.uid())
    AND c.subscription_tier = 'pro'
  )
);

DROP POLICY IF EXISTS "Pro users can update profile permissions" ON public.profile_permissions;
CREATE POLICY "Pro users can update profile permissions" ON public.profile_permissions
FOR UPDATE USING (
  EXISTS (
    SELECT 1 FROM public.profiles p
    JOIN public.companies c ON p.company_id = c.id
    WHERE p.id = (SELECT auth.uid())
    AND c.subscription_tier = 'pro'
  )
);

DROP POLICY IF EXISTS "Users can view their own profile permissions" ON public.profile_permissions;
CREATE POLICY "Users can view their own profile permissions" ON public.profile_permissions
FOR SELECT USING (
  profile_id IN (
    SELECT id FROM public.in_app_profiles
    WHERE user_id = (SELECT auth.uid())
  )
);

-- ============================================================================
-- COMPANIES TABLE
-- ============================================================================

DROP POLICY IF EXISTS "Owners can delete their own company" ON public.companies;
CREATE POLICY "Owners can delete their own company" ON public.companies
FOR DELETE USING (
  id = (
    SELECT company_id FROM public.profiles
    WHERE id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "Owners can insert their own company" ON public.companies;
CREATE POLICY "Owners can insert their own company" ON public.companies
FOR INSERT WITH CHECK (
  id = (
    SELECT company_id FROM public.profiles
    WHERE id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "Owners can update their own company" ON public.companies;
CREATE POLICY "Owners can update their own company" ON public.companies
FOR UPDATE USING (
  id = (
    SELECT company_id FROM public.profiles
    WHERE id = (SELECT auth.uid())
  )
);

-- ============================================================================
-- PUSH_SUBSCRIPTIONS TABLE
-- ============================================================================

DROP POLICY IF EXISTS "Users can manage their own push subscriptions" ON public.push_subscriptions;
CREATE POLICY "Users can manage their own push subscriptions" ON public.push_subscriptions
FOR ALL USING (user_id = (SELECT auth.uid()));

-- ============================================================================
-- END OF MIGRATION
-- ============================================================================

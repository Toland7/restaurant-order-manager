-- Migration: Consolidate Multiple Permissive Policies
-- Date: 2025-12-01
-- Description: Consolidates redundant RLS policies to improve query performance
--              by reducing the number of policy evaluations per query.
-- Reference: https://supabase.com/docs/guides/database/database-linter?lint=0006_multiple_permissive_policies

-- ============================================================================
-- PROFILES TABLE - Consolidate SELECT policies
-- ============================================================================

-- Remove old policies
DROP POLICY IF EXISTS "Admins can manage all profiles" ON public.profiles;
DROP POLICY IF EXISTS "Admins can view all profiles" ON public.profiles;
DROP POLICY IF EXISTS "Users can view their own profile" ON public.profiles;

-- Remove new policy if it already exists (idempotency fix)
DROP POLICY IF EXISTS "profiles_select_policy" ON public.profiles;

-- Create consolidated SELECT policy
CREATE POLICY "profiles_select_policy" ON public.profiles
FOR SELECT USING (
  -- Users can view their own profile
  id = (SELECT auth.uid())
  OR
  -- Admins can view all profiles (using helper function to avoid recursion)
  public.is_admin()
);

-- ============================================================================
-- PROFILES TABLE - Consolidate UPDATE policies
-- ============================================================================

-- Remove old policies
DROP POLICY IF EXISTS "Admins can update all profiles" ON public.profiles;
DROP POLICY IF EXISTS "Users can update their own profile" ON public.profiles;

-- Remove new policy if it already exists (idempotency fix)
DROP POLICY IF EXISTS "profiles_update_policy" ON public.profiles;

-- Create consolidated UPDATE policy
CREATE POLICY "profiles_update_policy" ON public.profiles
FOR UPDATE USING (
  -- Users can update their own profile
  id = (SELECT auth.uid())
  OR
  -- Admins can update all profiles (using helper function to avoid recursion)
  public.is_admin()
);

-- ============================================================================
-- PROFILES TABLE - Consolidate DELETE policies
-- ============================================================================

-- Remove old policies
DROP POLICY IF EXISTS "Users can delete their own profile" ON public.profiles;

-- Remove new policy if it already exists (idempotency fix)
DROP POLICY IF EXISTS "profiles_delete_policy" ON public.profiles;

-- Create consolidated DELETE policy (keep admin policy from previous migration)
CREATE POLICY "profiles_delete_policy" ON public.profiles
FOR DELETE USING (
  -- Users can delete their own profile
  id = (SELECT auth.uid())
  OR
  -- Admins can delete all profiles (using helper function to avoid recursion)
  public.is_admin()
);

-- ============================================================================
-- PROFILES TABLE - Consolidate INSERT policies
-- ============================================================================

-- Remove old policies
DROP POLICY IF EXISTS "Users can insert their own profile" ON public.profiles;

-- Remove new policy if it already exists (idempotency fix)
DROP POLICY IF EXISTS "profiles_insert_policy" ON public.profiles;

-- Create consolidated INSERT policy
CREATE POLICY "profiles_insert_policy" ON public.profiles
FOR INSERT WITH CHECK (
  -- Users can insert their own profile
  id = (SELECT auth.uid())
  OR
  -- Admins can insert all profiles (using helper function to avoid recursion)
  public.is_admin()
);

-- ============================================================================
-- NOTIFICATIONS TABLE - Consolidate SELECT policies
-- ============================================================================

-- Remove old policies
DROP POLICY IF EXISTS "Admins can view all notifications" ON public.notifications;
DROP POLICY IF EXISTS "Users can view own notifications" ON public.notifications;
DROP POLICY IF EXISTS "Users can manage their own notifications" ON public.notifications;

-- Remove new policy if it already exists (idempotency fix)
DROP POLICY IF EXISTS "notifications_select_policy" ON public.notifications;

-- Create consolidated SELECT policy
CREATE POLICY "notifications_select_policy" ON public.notifications
FOR SELECT USING (
  -- Users can view their own notifications
  user_id = (SELECT auth.uid())
  OR
  -- Admins can view all notifications (using helper function to avoid recursion)
  public.is_admin()
);

-- ============================================================================
-- SCHEDULED_ORDERS TABLE - Consolidate SELECT policies
-- ============================================================================

-- Remove old policies
DROP POLICY IF EXISTS "Users can view own scheduled orders" ON public.scheduled_orders;
DROP POLICY IF EXISTS "Users can manage their own scheduled orders" ON public.scheduled_orders;

-- Remove new policy if it already exists (idempotency fix)
DROP POLICY IF EXISTS "scheduled_orders_select_policy" ON public.scheduled_orders;

-- Create consolidated SELECT policy
CREATE POLICY "scheduled_orders_select_policy" ON public.scheduled_orders
FOR SELECT USING (
  user_id = (SELECT auth.uid())
);

-- ============================================================================
-- IN_APP_PROFILES TABLE - Consolidate SELECT policies
-- ============================================================================

-- Remove old policies
DROP POLICY IF EXISTS "Allow users to manage their in-app profiles" ON public.in_app_profiles;
DROP POLICY IF EXISTS "Allow users to read their own in-app profiles" ON public.in_app_profiles;

-- Remove new policy if it already exists (idempotency fix)
DROP POLICY IF EXISTS "in_app_profiles_all_policy" ON public.in_app_profiles;

-- Create consolidated policy for all operations
CREATE POLICY "in_app_profiles_all_policy" ON public.in_app_profiles
FOR ALL USING (user_id = (SELECT auth.uid()));

-- ============================================================================
-- PROFILE_PERMISSIONS TABLE - Consolidate SELECT policies
-- ============================================================================

-- Remove duplicate SELECT policies
DROP POLICY IF EXISTS "Allow users to read their own profile permissions" ON public.profile_permissions;
DROP POLICY IF EXISTS "Users can view their own profile permissions" ON public.profile_permissions;

-- Remove new policy if it already exists (idempotency fix)
DROP POLICY IF EXISTS "profile_permissions_select_policy" ON public.profile_permissions;

-- Create consolidated SELECT policy
CREATE POLICY "profile_permissions_select_policy" ON public.profile_permissions
FOR SELECT USING (
  profile_id IN (
    SELECT id FROM public.in_app_profiles
    WHERE user_id = (SELECT auth.uid())
  )
);

-- ============================================================================
-- PROFILE_PERMISSIONS TABLE - Consolidate INSERT policies
-- ============================================================================

-- Remove old policies
DROP POLICY IF EXISTS "Allow users to insert permissions for their own profiles" ON public.profile_permissions;
DROP POLICY IF EXISTS "Pro users can insert profile permissions" ON public.profile_permissions;

-- Remove new policy if it already exists (idempotency fix)
DROP POLICY IF EXISTS "profile_permissions_insert_policy" ON public.profile_permissions;

-- Create consolidated INSERT policy
CREATE POLICY "profile_permissions_insert_policy" ON public.profile_permissions
FOR INSERT WITH CHECK (
  profile_id IN (
    SELECT id FROM public.in_app_profiles
    WHERE user_id = (SELECT auth.uid())
  )
  OR
  EXISTS (
    SELECT 1 FROM public.profiles p
    JOIN public.companies c ON p.company_id = c.id
    WHERE p.id = (SELECT auth.uid())
    AND c.subscription_tier = 'pro'
  )
);

-- ============================================================================
-- PROFILE_PERMISSIONS TABLE - Consolidate UPDATE policies
-- ============================================================================

-- Remove old policies
DROP POLICY IF EXISTS "Allow users to update permissions for their own profiles" ON public.profile_permissions;
DROP POLICY IF EXISTS "Pro users can update profile permissions" ON public.profile_permissions;

-- Remove new policy if it already exists (idempotency fix)
DROP POLICY IF EXISTS "profile_permissions_update_policy" ON public.profile_permissions;

-- Create consolidated UPDATE policy
CREATE POLICY "profile_permissions_update_policy" ON public.profile_permissions
FOR UPDATE USING (
  profile_id IN (
    SELECT id FROM public.in_app_profiles
    WHERE user_id = (SELECT auth.uid())
  )
  OR
  EXISTS (
    SELECT 1 FROM public.profiles p
    JOIN public.companies c ON p.company_id = c.id
    WHERE p.id = (SELECT auth.uid())
    AND c.subscription_tier = 'pro'
  )
);

-- ============================================================================
-- PROFILE_PERMISSIONS TABLE - Consolidate DELETE policies
-- ============================================================================

-- Remove old policies
DROP POLICY IF EXISTS "Allow users to delete permissions for their own profiles" ON public.profile_permissions;
DROP POLICY IF EXISTS "Pro users can delete profile permissions" ON public.profile_permissions;

-- Remove new policy if it already exists (idempotency fix)
DROP POLICY IF EXISTS "profile_permissions_delete_policy" ON public.profile_permissions;

-- Create consolidated DELETE policy
CREATE POLICY "profile_permissions_delete_policy" ON public.profile_permissions
FOR DELETE USING (
  profile_id IN (
    SELECT id FROM public.in_app_profiles
    WHERE user_id = (SELECT auth.uid())
  )
  OR
  EXISTS (
    SELECT 1 FROM public.profiles p
    JOIN public.companies c ON p.company_id = c.id
    WHERE p.id = (SELECT auth.uid())
    AND c.subscription_tier = 'pro'
  )
);

-- ============================================================================
-- END OF MIGRATION
-- ============================================================================

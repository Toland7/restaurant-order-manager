-- Migration: Fix missing policies for scheduled_orders and notifications
-- Date: 2025-12-02
-- Description: Restores missing INSERT, UPDATE, DELETE policies that were accidentally removed
--              during the consolidation process. Fixes 403 Forbidden on scheduled_orders POST.

-- ============================================================================
-- SCHEDULED_ORDERS TABLE
-- ============================================================================

-- Drop the SELECT-only policy created in the previous migration
DROP POLICY IF EXISTS "scheduled_orders_select_policy" ON public.scheduled_orders;

-- Drop any other potential leftovers
DROP POLICY IF EXISTS "Users can view own scheduled orders" ON public.scheduled_orders;
DROP POLICY IF EXISTS "Users can manage their own scheduled orders" ON public.scheduled_orders;

-- Create a comprehensive FOR ALL policy
-- This allows SELECT, INSERT, UPDATE, DELETE for the owner
CREATE POLICY "scheduled_orders_all_policy" ON public.scheduled_orders
FOR ALL USING (
  user_id = (SELECT auth.uid())
);

-- ============================================================================
-- NOTIFICATIONS TABLE - Add missing INSERT and DELETE policies
-- ============================================================================

-- 1. INSERT POLICY
DROP POLICY IF EXISTS "notifications_insert_policy" ON public.notifications;
DROP POLICY IF EXISTS "Users can insert own notifications" ON public.notifications;

CREATE POLICY "notifications_insert_policy" ON public.notifications
FOR INSERT WITH CHECK (
  -- Users can insert their own notifications
  user_id = (SELECT auth.uid())
  OR
  -- Admins can insert notifications (using helper function)
  public.is_admin()
);

-- 2. DELETE POLICY
DROP POLICY IF EXISTS "notifications_delete_policy" ON public.notifications;
DROP POLICY IF EXISTS "Users can delete own notifications" ON public.notifications;

CREATE POLICY "notifications_delete_policy" ON public.notifications
FOR DELETE USING (
  -- Users can delete their own notifications
  user_id = (SELECT auth.uid())
  OR
  -- Admins can delete notifications (using helper function)
  public.is_admin()
);

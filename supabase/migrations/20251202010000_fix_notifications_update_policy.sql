-- Migration: Add missing UPDATE policy for notifications
-- Date: 2025-12-02
-- Description: Adds the missing UPDATE policy for notifications table to allow users
--              to mark notifications as read. This fixes the 406 Not Acceptable error.

-- ============================================================================
-- NOTIFICATIONS TABLE - Add UPDATE policy
-- ============================================================================

-- Remove old policies if they exist
DROP POLICY IF EXISTS "Users can update own notifications" ON public.notifications;
DROP POLICY IF EXISTS "notifications_update_policy" ON public.notifications;

-- Create consolidated UPDATE policy
CREATE POLICY "notifications_update_policy" ON public.notifications
FOR UPDATE USING (
  -- Users can update their own notifications
  user_id = (SELECT auth.uid())
  OR
  -- Admins can update all notifications (using helper function to avoid recursion)
  public.is_admin()
);

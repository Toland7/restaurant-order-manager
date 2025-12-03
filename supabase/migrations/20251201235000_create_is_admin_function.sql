-- Migration: Create helper function to check admin role
-- Date: 2025-12-01
-- Description: Creates a SECURITY DEFINER function to check if current user is admin
--              This prevents infinite recursion in RLS policies.

-- Drop existing function if it exists
DROP FUNCTION IF EXISTS public.is_admin() CASCADE;

-- Create function to check if current user is admin
-- SECURITY DEFINER allows it to bypass RLS
CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 
    FROM public.profiles
    WHERE id = auth.uid()
    AND role = 'admin'
  );
END;
$$;

-- Grant execute permission to authenticated users
GRANT EXECUTE ON FUNCTION public.is_admin() TO authenticated;
GRANT EXECUTE ON FUNCTION public.is_admin() TO anon;

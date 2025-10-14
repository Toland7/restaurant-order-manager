-- Add is_admin flag to profiles table
ALTER TABLE profiles
ADD COLUMN is_admin BOOLEAN DEFAULT FALSE;

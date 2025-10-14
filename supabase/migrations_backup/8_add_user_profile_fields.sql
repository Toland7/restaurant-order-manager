-- Add new fields to profiles table
ALTER TABLE profiles
ADD COLUMN first_name TEXT,
ADD COLUMN last_name TEXT,
ADD COLUMN role TEXT,
ADD COLUMN company_vat_id TEXT,
ADD COLUMN company_name TEXT,
ADD COLUMN headquarters_address TEXT,
ADD COLUMN headquarters_name TEXT;

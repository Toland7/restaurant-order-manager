-- Add preferred_email_client to suppliers to allow specifying an email client.
-- This will be used to generate the correct mailto link.

ALTER TABLE public.suppliers
ADD COLUMN preferred_email_client TEXT NOT NULL DEFAULT 'default';

-- Add a check constraint to ensure only valid values are inserted.
ALTER TABLE public.suppliers
ADD CONSTRAINT check_preferred_email_client
CHECK (preferred_email_client IN ('default', 'gmail', 'outlook'));

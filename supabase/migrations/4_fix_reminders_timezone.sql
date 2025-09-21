-- Add the new timezone-aware column
ALTER TABLE public.scheduled_orders
ADD COLUMN scheduled_at TIMESTAMPTZ;

-- Attempt to populate the new column from the old ones.
-- This assumes the old time was saved in the DB's default timezone (usually UTC).
-- This is a best-effort migration for existing data.
UPDATE public.scheduled_orders
SET scheduled_at = scheduled_date + time_to_send;

-- Drop the old columns
ALTER TABLE public.scheduled_orders
DROP COLUMN scheduled_date;

ALTER TABLE public.scheduled_orders
DROP COLUMN time_to_send;

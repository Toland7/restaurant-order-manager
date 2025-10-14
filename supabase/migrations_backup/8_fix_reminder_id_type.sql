-- Recreate the reminder_id column with the correct uuid type
ALTER TABLE public.notifications
DROP COLUMN IF EXISTS reminder_id;

ALTER TABLE public.notifications
ADD COLUMN reminder_id uuid;

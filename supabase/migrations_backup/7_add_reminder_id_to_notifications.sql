-- Add a column to link notifications to scheduled orders
ALTER TABLE public.notifications
ADD COLUMN IF NOT EXISTS reminder_id bigint;

-- Optional: Add a foreign key constraint if you want to enforce integrity
-- ALTER TABLE public.notifications
-- ADD CONSTRAINT fk_scheduled_orders
-- FOREIGN KEY (reminder_id)
-- REFERENCES public.scheduled_orders(id)
-- ON DELETE SET NULL; -- Or ON DELETE CASCADE, depending on desired behavior

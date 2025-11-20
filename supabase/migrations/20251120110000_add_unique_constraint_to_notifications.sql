ALTER TABLE public.notifications
ADD CONSTRAINT notifications_reminder_id_user_id_unique UNIQUE (reminder_id, user_id);

DELETE FROM public.notifications
WHERE id IN (
    SELECT id
    FROM (
        SELECT id,
               ROW_NUMBER() OVER (PARTITION BY reminder_id, user_id ORDER BY created_at DESC) as rn
        FROM public.notifications
        WHERE reminder_id IS NOT NULL
    ) t
    WHERE rn > 1
);
-- Cleanup orphan records in profile_permissions that reference non-existent permissions
-- This can happen if permissions table was recreated with different IDs

DELETE FROM public.profile_permissions
WHERE permission_id NOT IN (SELECT id FROM public.permissions);

-- Ensure foreign key constraint exists for future data integrity
-- (if it doesn't exist already)
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.table_constraints 
    WHERE constraint_name = 'profile_permissions_permission_id_fkey'
    AND table_name = 'profile_permissions'
  ) THEN
    ALTER TABLE public.profile_permissions
    ADD CONSTRAINT profile_permissions_permission_id_fkey
    FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
  END IF;
END $$;

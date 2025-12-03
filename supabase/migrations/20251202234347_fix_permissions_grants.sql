-- Grant usage on schema public
GRANT USAGE ON SCHEMA public TO postgres, anon, authenticated, service_role;

-- Grant all privileges on all tables in schema public to authenticated and service_role
GRANT ALL ON ALL TABLES IN SCHEMA public TO authenticated, service_role;
GRANT ALL ON ALL TABLES IN SCHEMA public TO postgres;

-- Allow anon to select (if needed for login/public pages, adjust as necessary)
-- Usually anon needs access to specific tables, but for debugging let's be permissive on SELECT if RLS is enabled
-- RLS will still restrict access even if GRANT SELECT is given.
GRANT SELECT ON ALL TABLES IN SCHEMA public TO anon;

-- Grant all privileges on all sequences in schema public
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO authenticated, service_role;

-- Grant all privileges on all routines in schema public
GRANT ALL ON ALL ROUTINES IN SCHEMA public TO authenticated, service_role;

-- Ensure is_admin is owned by a privileged user (postgres) to make SECURITY DEFINER work correctly
ALTER FUNCTION public.is_admin() OWNER TO postgres;

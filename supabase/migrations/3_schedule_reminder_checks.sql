-- Enable pg_cron extension
CREATE EXTENSION IF NOT EXISTS pg_cron WITH SCHEMA extensions;

-- Grant usage of the new schema to postgres
GRANT USAGE ON SCHEMA extensions TO postgres;

-- Grant all privileges on all tables in the new schema to postgres
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA extensions TO postgres;

-- Schedule the 'send-reminders' function to run every minute
SELECT cron.schedule(
  'send-reminders-job',
  '* * * * *', -- Every minute
  $BODY$
    SELECT net.http_post(
        url:= 'https://qclhxegpukzcuptmrozo.supabase.co/functions/v1/send-reminders',
        headers:= '{"Content-Type": "application/json", "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFjbGh4ZWdwdWt6Y3VwdG1yb3pvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgxNTUxMzYsImV4cCI6MjA3MzczMTEzNn0.0cs8P_Ohocnps76FeMbPHnwU6dX828eTt7sLGKV_RKk"}'::jsonb
    );
  $BODY$
);

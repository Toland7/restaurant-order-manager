CREATE OR REPLACE FUNCTION public.update_updated_at_column()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER -- Assuming it has SECURITY DEFINER, as per the warning
 SET search_path = public, pg_temp -- Explicitly set a safe search_path
AS $function$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$function$;
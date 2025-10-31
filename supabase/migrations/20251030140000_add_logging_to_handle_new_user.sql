CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $function$
BEGIN
  RAISE NOTICE 'Attempting to insert profile for user: %', NEW.id;
  INSERT INTO public.profiles (id)
  VALUES (NEW.id);
  RAISE NOTICE 'Profile inserted successfully for user: %', NEW.id;
  RETURN NEW;
EXCEPTION
  WHEN OTHERS THEN
    RAISE NOTICE 'Error inserting profile for user %: %', NEW.id, SQLERRM;
    RETURN NEW; -- Return NEW to allow the auth.users insert to complete
END;
$function$
;
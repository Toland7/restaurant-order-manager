CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO ''
AS $function$
BEGIN
  RAISE NOTICE 'Attempting to insert profile for user: %', NEW.id;
  INSERT INTO public.profiles (
    id,
    first_name,
    last_name,
    role,
    company_name,
    company_vat_id,
    headquarters_name,
    headquarters_address
  )
  VALUES (
    NEW.id,
    NEW.raw_user_meta_data->>'first_name',
    NEW.raw_user_meta_data->>'last_name',
    NEW.raw_user_meta_data->>'role',
    NEW.raw_user_meta_data->>'company_name',
    NEW.raw_user_meta_data->>'company_vat_id',
    NEW.raw_user_meta_data->>'headquarters_name',
    NEW.raw_user_meta_data->>'headquarters_address'
  );
  RAISE NOTICE 'Profile inserted successfully for user: %', NEW.id;
  RETURN NEW;
EXCEPTION
  WHEN OTHERS THEN
    RAISE NOTICE 'Error inserting profile for user %: %', NEW.id, SQLERRM;
    RETURN NEW; -- Return NEW to allow the auth.users insert to complete
END;
$function$
;
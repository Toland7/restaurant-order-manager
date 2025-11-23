-- Script di riparazione per utente bd8c8cc4-b62f-4540-bc81-546907f6f9b1
-- Esegui questo nel SQL Editor di Supabase Dashboard

-- 1. Verifica utente in auth.users
SELECT id, email, raw_user_meta_data FROM auth.users 
WHERE id = 'bd8c8cc4-b62f-4540-bc81-546907f6f9b1';

-- 2. Crea la company
INSERT INTO public.companies (
  owner_id,
  name,
  vat_id,
  address,
  subscription_tier,
  trial_start_date,
  trial_end_date
) VALUES (
  'bd8c8cc4-b62f-4540-bc81-546907f6f9b1',
  'My Restaurant', -- Modifica se vuoi
  NULL,
  NULL,
  'demo',
  NOW(),
  NOW() + INTERVAL '30 days'
)
ON CONFLICT (owner_id) DO NOTHING
RETURNING *;

-- 3. Crea il profilo
INSERT INTO public.profiles (
  id,
  first_name,
  last_name,
  role,
  company_id
) VALUES (
  'bd8c8cc4-b62f-4540-bc81-546907f6f9b1',
  'User',
  'Demo',
  'Manager',
  (SELECT id FROM public.companies WHERE owner_id = 'bd8c8cc4-b62f-4540-bc81-546907f6f9b1')
)
ON CONFLICT (id) DO NOTHING
RETURNING *;

-- 4. Crea l'in_app_profile (solo se non esiste)
DO $$
DECLARE
  v_company_id UUID;
  v_existing_profile_id UUID;
BEGIN
  -- Get company_id
  SELECT id INTO v_company_id FROM public.companies WHERE owner_id = 'bd8c8cc4-b62f-4540-bc81-546907f6f9b1';
  
  -- Check if profile already exists
  SELECT id INTO v_existing_profile_id FROM public.in_app_profiles WHERE user_id = 'bd8c8cc4-b62f-4540-bc81-546907f6f9b1';
  
  IF v_existing_profile_id IS NULL THEN
    INSERT INTO public.in_app_profiles (user_id, profile_name, position, company_id)
    VALUES ('bd8c8cc4-b62f-4540-bc81-546907f6f9b1', 'User Demo', 'Proprietario', v_company_id);
    RAISE NOTICE 'Created in_app_profile';
  ELSE
    RAISE NOTICE 'in_app_profile already exists with id: %', v_existing_profile_id;
  END IF;
END $$;

-- 5. Assegna TUTTI i permessi TRANNE profiles:manage
DO $$
DECLARE
  v_profile_id UUID;
  v_permission RECORD;
  v_count INT := 0;
BEGIN
  -- Get the in_app_profile id
  SELECT id INTO v_profile_id 
  FROM public.in_app_profiles 
  WHERE user_id = 'bd8c8cc4-b62f-4540-bc81-546907f6f9b1'
  LIMIT 1;

  IF v_profile_id IS NULL THEN
    RAISE EXCEPTION 'in_app_profile not found for user bd8c8cc4-b62f-4540-bc81-546907f6f9b1';
  END IF;

  RAISE NOTICE 'Found in_app_profile: %', v_profile_id;

  -- Assign all permissions except profiles:manage
  FOR v_permission IN 
    SELECT id, name FROM public.permissions WHERE name <> 'profiles:manage'
  LOOP
    INSERT INTO public.profile_permissions (profile_id, permission_id)
    VALUES (v_profile_id, v_permission.id)
    ON CONFLICT DO NOTHING;
    
    v_count := v_count + 1;
    RAISE NOTICE 'Added permission % (%)', v_permission.name, v_permission.id;
  END LOOP;

  RAISE NOTICE 'Total permissions added: %', v_count;
END $$;

-- 6. Verifica finale
SELECT 
  p.id AS profile_id,
  p.first_name,
  p.last_name,
  c.id AS company_id,
  c.name AS company_name,
  c.subscription_tier,
  c.trial_start_date,
  c.trial_end_date,
  iap.id AS inapp_profile_id,
  iap.profile_name,
  COUNT(pp.permission_id) AS permissions_count
FROM public.profiles p
JOIN public.companies c ON p.company_id = c.id
LEFT JOIN public.in_app_profiles iap ON iap.user_id = p.id
LEFT JOIN public.profile_permissions pp ON pp.profile_id = iap.id
WHERE p.id = 'bd8c8cc4-b62f-4540-bc81-546907f6f9b1'
GROUP BY p.id, p.first_name, p.last_name, c.id, c.name, c.subscription_tier, c.trial_start_date, c.trial_end_date, iap.id, iap.profile_name;

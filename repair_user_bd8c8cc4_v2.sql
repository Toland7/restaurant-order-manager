-- Script di riparazione per utente bd8c8cc4-b62f-4540-bc81-546907f6f9b1
-- Esegui questo nel SQL Editor di Supabase Dashboard

-- VERSIONE SEMPLIFICATA SENZA ON CONFLICT

-- 1. Verifica utente in auth.users
SELECT id, email, raw_user_meta_data FROM auth.users 
WHERE id = 'bd8c8cc4-b62f-4540-bc81-546907f6f9b1';

-- 2. Crea tutto in un unico blocco
DO $$
DECLARE
  v_company_id UUID;
  v_profile_id UUID;
  v_permission RECORD;
  v_count INT := 0;
  v_existing_company UUID;
  v_existing_profile UUID;
  v_existing_inapp UUID;
BEGIN
  -- Check if company exists
  SELECT id INTO v_existing_company FROM public.companies WHERE owner_id = 'bd8c8cc4-b62f-4540-bc81-546907f6f9b1';
  
  IF v_existing_company IS NULL THEN
    INSERT INTO public.companies (owner_id, name, vat_id, address, subscription_tier, trial_start_date, trial_end_date)
    VALUES ('bd8c8cc4-b62f-4540-bc81-546907f6f9b1', 'My Restaurant', NULL, NULL, 'demo', NOW(), NOW() + INTERVAL '30 days')
    RETURNING id INTO v_company_id;
    RAISE NOTICE '✅ Created company: %', v_company_id;
  ELSE
    v_company_id := v_existing_company;
    RAISE NOTICE '⚠️  Company already exists: %', v_company_id;
  END IF;

  -- Check if profile exists
  SELECT id INTO v_existing_profile FROM public.profiles WHERE id = 'bd8c8cc4-b62f-4540-bc81-546907f6f9b1';
  
  IF v_existing_profile IS NULL THEN
    INSERT INTO public.profiles (id, first_name, last_name, role, company_id)
    VALUES ('bd8c8cc4-b62f-4540-bc81-546907f6f9b1', 'User', 'Demo', 'Manager', v_company_id);
    RAISE NOTICE '✅ Created profile';
  ELSE
    RAISE NOTICE '⚠️  Profile already exists';
  END IF;

  -- Check if in_app_profile exists
  SELECT id INTO v_existing_inapp FROM public.in_app_profiles WHERE user_id = 'bd8c8cc4-b62f-4540-bc81-546907f6f9b1';
  
  IF v_existing_inapp IS NULL THEN
    INSERT INTO public.in_app_profiles (user_id, profile_name, position, company_id)
    VALUES ('bd8c8cc4-b62f-4540-bc81-546907f6f9b1', 'User Demo', 'Proprietario', v_company_id)
    RETURNING id INTO v_profile_id;
    RAISE NOTICE '✅ Created in_app_profile: %', v_profile_id;
  ELSE
    v_profile_id := v_existing_inapp;
    RAISE NOTICE '⚠️  in_app_profile already exists: %', v_profile_id;
  END IF;

  -- Assign all permissions except profiles:manage
  FOR v_permission IN 
    SELECT id, name FROM public.permissions WHERE name <> 'profiles:manage'
  LOOP
    -- Check if permission already assigned
    IF NOT EXISTS (SELECT 1 FROM public.profile_permissions WHERE profile_id = v_profile_id AND permission_id = v_permission.id) THEN
      INSERT INTO public.profile_permissions (profile_id, permission_id)
      VALUES (v_profile_id, v_permission.id);
      v_count := v_count + 1;
      RAISE NOTICE '  ✅ Added permission: %', v_permission.name;
    ELSE
      RAISE NOTICE '  ⚠️  Permission already exists: %', v_permission.name;
    END IF;
  END LOOP;

  RAISE NOTICE '🎉 Total permissions added: %', v_count;
END $$;

-- 3. Verifica finale
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

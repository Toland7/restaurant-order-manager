-- Script per riparare il profilo mancante
-- Sostituisci i valori tra <> con i tuoi dati reali

-- IMPORTANTE: Esegui questo script nel SQL Editor di Supabase Dashboard

-- 1. Verifica se l'utente esiste in auth.users
SELECT id, email, raw_user_meta_data 
FROM auth.users 
WHERE id = '7a0ffdc4-7ad4-4415-bb1c-aae1d3522010';

-- 2. Verifica se esiste già una company per questo utente
SELECT * FROM public.companies WHERE owner_id = '7a0ffdc4-7ad4-4415-bb1c-aae1d3522010';

-- 3. Verifica se esiste già un profilo
SELECT * FROM public.profiles WHERE id = '7a0ffdc4-7ad4-4415-bb1c-aae1d3522010';

-- 4. Se NON esiste la company, creala (MODIFICA I VALORI!)
INSERT INTO public.companies (
  owner_id,
  name,
  vat_id,
  address,
  subscription_tier,
  trial_start_date,
  trial_end_date
) VALUES (
  '7a0ffdc4-7ad4-4415-bb1c-aae1d3522010',
  'Il Tuo Ristorante', -- <-- MODIFICA QUI
  'IT12345678901', -- <-- MODIFICA QUI (o NULL se non hai P.IVA)
  'Via Example 123, Roma', -- <-- MODIFICA QUI (o NULL)
  'demo', -- Tier: 'demo' per trial, 'base' o 'pro'
  NOW(), -- Trial start (NOW = adesso)
  NOW() + INTERVAL '30 days' -- Trial end (30 giorni da ora)
)
ON CONFLICT (owner_id) DO NOTHING
RETURNING id;

-- 5. Se NON esiste il profilo, crealo (MODIFICA I VALORI!)
-- Prendi il company_id dalla query precedente
INSERT INTO public.profiles (
  id,
  first_name,
  last_name,
  role,
  company_id
) VALUES (
  '7a0ffdc4-7ad4-4415-bb1c-aae1d3522010',
  'Mario', -- <-- MODIFICA QUI
  'Rossi', -- <-- MODIFICA QUI
  'Manager', -- <-- MODIFICA QUI (o NULL)
  (SELECT id FROM public.companies WHERE owner_id = '7a0ffdc4-7ad4-4415-bb1c-aae1d3522010')
)
ON CONFLICT (id) DO NOTHING;

-- 6. Se NON esiste l'in_app_profile, crealo
INSERT INTO public.in_app_profiles (
  user_id,
  profile_name,
  position,
  company_id
) VALUES (
  '7a0ffdc4-7ad4-4415-bb1c-aae1d3522010',
  'Mario Rossi', -- <-- MODIFICA QUI (Nome completo)
  'Proprietario',
  (SELECT id FROM public.companies WHERE owner_id = '7a0ffdc4-7ad4-4415-bb1c-aae1d3522010')
)
ON CONFLICT DO NOTHING
RETURNING id;

-- 7. Assegna TUTTI i permessi TRANNE profiles:manage
-- (Prendi l'in_app_profile_id dalla query precedente)
DO $$
DECLARE
  v_profile_id UUID;
  v_permission RECORD;
BEGIN
  -- Get the in_app_profile id
  SELECT id INTO v_profile_id 
  FROM public.in_app_profiles 
  WHERE user_id = '7a0ffdc4-7ad4-4415-bb1c-aae1d3522010'
  LIMIT 1;

  -- Assign all permissions except profiles:manage
  FOR v_permission IN 
    SELECT id FROM public.permissions WHERE name <> 'profiles:manage'
  LOOP
    INSERT INTO public.profile_permissions (profile_id, permission_id)
    VALUES (v_profile_id, v_permission.id)
    ON CONFLICT DO NOTHING;
    
    RAISE NOTICE 'Added permission % to profile %', v_permission.id, v_profile_id;
  END LOOP;
END $$;

-- 8. Verifica finale
SELECT 
  p.id,
  p.first_name,
  p.last_name,
  c.name as company_name,
  c.subscription_tier,
  c.trial_start_date,
  c.trial_end_date,
  COUNT(pp.permission_id) as permissions_count
FROM public.profiles p
JOIN public.companies c ON p.company_id = c.id
LEFT JOIN public.in_app_profiles iap ON iap.user_id = p.id
LEFT JOIN public.profile_permissions pp ON pp.profile_id = iap.id
WHERE p.id = '7a0ffdc4-7ad4-4415-bb1c-aae1d3522010'
GROUP BY p.id, p.first_name, p.last_name, c.name, c.subscription_tier, c.trial_start_date, c.trial_end_date;

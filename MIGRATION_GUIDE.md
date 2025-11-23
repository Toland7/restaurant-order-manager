# Guida all'applicazione delle migrazioni per Demo/Base/Pro

## Panoramica

Queste migrazioni aggiornano la gestione dei profili e dei permessi per distinguere correttamente tra utenti Demo, Base e Pro. Il trial demo scade dopo 30 giorni e blocca l'app fino all'upgrade.

## File SQL creati

### 1. `202511150000_update_handle_new_user_create_inapp_profile.sql`

**Cosa fa:** Aggiorna il trigger `handle_new_user` per creare sempre un `in_app_profile` per ogni nuovo utente e assegnare i permessi in base al tier.

**Come applicare:**

1. Vai su Supabase Dashboard → SQL Editor
2. Copia e incolla tutto il contenuto del file
3. Clicca su "Run"
4. Verifica che non ci siano errori

### 2. `202511150001_backfill_existing_users_permissions.sql`

**Cosa fa:** Assegna tutti i permessi (tranne `profiles:manage`) a tutti gli utenti esistenti con tier `demo` o `base`.

**Come applicare:**

1. Vai su Supabase Dashboard → SQL Editor
2. Copia e incolla tutto il contenuto del file
3. Clicca su "Run"
4. Controlla i log (NOTICE) per vedere quanti permessi sono stati aggiunti

**IMPORTANTE:** Questa migrazione è **idempotente** (può essere eseguita più volte senza problemi) grazie al controllo `v_existing_permission`.

### 3. `202511150002_update_rls_profiles_manage.sql`

**Cosa fa:** Aggiorna le policy RLS su `profile_permissions` per garantire che solo gli utenti Pro possano gestire il permesso `profiles:manage`.

**Come applicare:**

1. Vai su Supabase Dashboard → SQL Editor
2. Copia e incolla tutto il contenuto del file
3. Clicca su "Run"
4. Verifica che le policy siano state create correttamente

## Verifica post-migrazione

Dopo aver applicato tutte le migrazioni, verifica quanto segue:

### Test 1: Nuovo utente Demo

1. Crea un nuovo account (dovrebbe essere tier `demo` di default)
2. Vai su Database → Table Editor → `in_app_profiles`
3. Verifica che sia stato creato un profilo per il nuovo utente
4. Vai su `profile_permissions` e cerca i record con `profile_id` del nuovo profilo
5. Dovresti vedere tutti i permessi **tranne** `profiles:manage`

### Test 2: Utenti esistenti

1. Vai su Database → Table Editor → `profile_permissions`
2. Per ogni profilo con tier `demo` o `base`, verifica che abbia tutti i permessi tranne `profiles:manage`
3. Gli utenti `pro` dovrebbero avere anche `profiles:manage`

### Test 3: Trial expiration

1. Trova un utente demo nel database
2. Vai su `companies` e modifica `trial_end_date` a una data nel passato
3. Ricarica l'app
4. Dovresti vedere il banner `TrialExpiredBanner` che blocca l'accesso

### Test 4: RLS Policies

1. Prova a inserire un permesso `profiles:manage` per un utente con tier `base` tramite SQL:
   ```sql
   INSERT INTO profile_permissions (profile_id, permission_id)
   VALUES (
     (SELECT id FROM in_app_profiles WHERE user_id = 'USER_ID_BASE'),
     (SELECT id FROM permissions WHERE name = 'profiles:manage')
   );
   ```
2. Dovresti ricevere un errore di violazione della policy RLS

## Rollback (in caso di problemi)

Se qualcosa va storto, puoi ripristinare lo stato precedente eseguendo queste query nell'ordine:

```sql
-- 1. Ripristina le policy RLS (usa i tuoi backup precedenti se disponibili)
-- Qui non possiamo fornire un rollback automatico, dovrai ripristinare manualmente

-- 2. Rimuovi i permessi aggiunti dal backfill (OPZIONALE, solo se necessario)
-- ATTENZIONE: questo rimuoverà TUTTI i permessi aggiunti dalla migrazione
DELETE FROM profile_permissions
WHERE profile_id IN (
  SELECT iap.id
  FROM in_app_profiles iap
  JOIN companies c ON iap.company_id = c.id
  WHERE c.subscription_tier IN ('demo', 'base')
)
AND permission_id IN (
  SELECT id FROM permissions WHERE name <> 'profiles:manage'
);

-- 3. Ripristina il trigger handle_new_user allo stato precedente
-- (usa il contenuto del file di migrazione precedente)
```

## Note importanti

- ✅ Le migrazioni **NON** modificano i dati degli utenti esistenti (solo i permessi)
- ✅ Le migrazioni sono **idempotenti** (possono essere eseguite più volte)
- ✅ Gli utenti esistenti continueranno a funzionare normalmente
- ⚠️ Il nuovo trigger si applica solo ai **nuovi** utenti creati dopo l'applicazione
- ⚠️ Il tier di default per nuovi utenti è `demo` (30 giorni di trial)

## Supporto

Se hai problemi durante l'applicazione:

1. Controlla i log della query SQL per errori specifici
2. Verifica che le tabelle `permissions`, `in_app_profiles`, `companies` esistano
3. Assicurati di avere i permessi di admin su Supabase

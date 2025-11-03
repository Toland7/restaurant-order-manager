### Roadmap di Implementazione: Gestione Utenti In-App a Livelli

Documento di monitoraggio per l'implementazione della funzionalità di profili utente multipli, protetti da PIN e legati ai piani di sottoscrizione.

---

#### **Fase 1: Infrastruttura Database e Sicurezza (Supabase)**

*   [x] **1.1. Definizione Tipi e Tabelle:**
    *   [x] Creare il file di migrazione SQL in `supabase/migrations/`.
    *   [x] Definire e creare il tipo `ENUM` `public.role` con i valori `'OWNER'` e `'MEMBER'`.
    *   [x] Definire e creare la tabella `public.in_app_profiles` con le colonne: `id`, `user_id`, `profile_name`, `role`.
    *   [x] Aggiungere la colonna `pin_hash` (tipo `TEXT`, `nullable`) alla tabella `in_app_profiles`.

*   [x] **1.2. Migrazione Dati Esistenti:**
    *   [x] Nello stesso script di migrazione, aggiungere la logica per popolare la tabella `in_app_profiles` per tutti gli utenti esistenti, assegnando loro il ruolo `'OWNER'` e derivando `profile_name` dal loro `full_name`.

*   [x] **1.3. Policy di Sicurezza (RLS):**
    *   [x] Abilitare la Row Level Security (RLS) sulla tabella `in_app_profiles`.
    *   [x] Creare una policy di `SELECT` che permetta agli utenti di leggere solo i profili associati al proprio `user_id`.
    *   [x] Creare una policy di `INSERT`, `UPDATE`, `DELETE` che permetta la modifica solo agli utenti che agiscono con un profilo `'OWNER'`.

*   [ ] **1.4. Schema del Piano di Sottoscrizione:**
    *   [ ] Verificare che la tabella `profiles` (o una tabella collegata) contenga un campo per il piano di sottoscrizione (es. `subscription_tier` con valori come `'FREE'`, `'PRO'`, `'ENTERPRISE'`). Se non esiste, aggiungerlo.

---

#### **Fase 2: Logica Backend Sicura (Supabase Edge Functions)**

*   [ ] **2.1. Setup Ambiente di Sviluppo:**
    *   [ ] Configurare l'ambiente di sviluppo locale di Supabase per creare e testare le Edge Functions.

*   [ ] **2.2. Funzione per Impostare il PIN:**
    *   [ ] Creare la Edge Function `set-profile-pin`.
    *   [ ] Implementare la logica di hashing del PIN (es. con `bcrypt`).
    *   [ ] Implementare la logica di salvataggio dell'hash nel database.
    *   [ ] Aggiungere i controlli di sicurezza (l'utente deve essere Owner).

*   [ ] **2.3. Funzione per Verificare il PIN:**
    *   [ ] Creare la Edge Function `verify-profile-pin`.
    *   [ ] Implementare la logica di confronto tra il PIN fornito e l'hash salvato.
    *   [ ] Aggiungere i controlli di sicurezza.

*   [ ] **2.4. Deploy delle Functions:**
    *   [ ] Eseguire il deploy delle Edge Functions (`set-profile-pin`, `verify-profile-pin`) sull'ambiente Supabase.

---

#### **Fase 3: Sviluppo Frontend e User Experience (React)**

*   [ ] **3.1. Gestione dello Stato e Logica Condizionale:**
    *   [ ] Aggiornare `AuthContext` per gestire lo stato di `currentProfile` e `subscription_tier`.
    *   [ ] Implementare la logica post-login per recuperare il piano di sottoscrizione e la lista di profili.
    *   [ ] Implementare il routing condizionale:
        *   `FREE`: Login automatico con profilo Owner.
        *   `PRO`/`ENTERPRISE`: Redirect alla pagina di selezione profilo.

*   [ ] **3.2. Schermata di Selezione Profilo:**
    *   [ ] Creare la nuova rotta e il componente pagina `/select-profile`.
    *   [ ] Sviluppare l'UI per la visualizzazione dei profili (es. card cliccabili).
    *   [ ] Creare il componente per l'inserimento del PIN a 4 cifre.
    *   [ ] Integrare la chiamata alla Edge Function `verify-profile-pin` e gestire la logica di successo/fallimento.

*   [ ] **3.3. Pannello di Gestione Utenti (per Owner PRO/ENTERPRISE):**
    *   [ ] Creare la nuova rotta e il componente pagina `/settings/user-management`.
    *   [ ] Rendere il link e la pagina accessibili solo se `subscription_tier` è `'PRO'`/`'ENTERPRISE'` E `currentProfile.role` è `'OWNER'`.
    *   [ ] Nel form di creazione/modifica, integrare il campo per il PIN e la chiamata alla Edge Function `set-profile-pin`.

---

#### **Fase 4: Test e Deployment**

*   [ ] **4.1. Test Funzionali:**
    *   [ ] Testare il flusso di login per un utente `FREE` (deve essere invariato).
    *   [ ] Testare il flusso di login per un utente `PRO`/`ENTERPRISE`:
        *   [ ] Visualizzazione corretta della pagina di selezione.
        *   [ ] Funzionamento del login con PIN corretto.
        *   [ ] Blocco dell'accesso con PIN errato.
    *   [ ] Testare il pannello di gestione utenti:
        *   [ ] Accesso consentito solo a Owner PRO/ENTERPRISE.
        *   [ ] Creazione di un nuovo profilo (con PIN).
        *   [ ] Modifica di un profilo esistente.
        *   [ ] Eliminazione di un profilo.

*   [ ] **4.2. Deployment:**
    *   [ ] Eseguire un backup completo del database di produzione.
    *   [ ] Applicare le migrazioni del database all'ambiente di staging e testare.
    *   [ ] Eseguire il deploy di tutte le modifiche (frontend, edge functions) in ambiente di staging.
    *   [ ] Eseguire un'ultima validazione end-to-end in staging.
    *   [ ] Pianificare ed eseguire il deployment in produzione.

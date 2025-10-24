# Checklist per il Go-Live

Questa è la lista di attività da completare per rendere l'applicazione pronta per il lancio in Europa.

### 1. Conformità Legale e GDPR

- [x] **Privacy Policy:** Creare una pagina dedicata e accessibile.
- [x] **Cookie Policy:** Implementare un banner per il consenso esplicito.
- [x] **Cookie Policy Page:** Creare una pagina dedicata per la policy dei cookie.
- [x] **Gestione Consenso Cookie:** Permettere agli utenti di modificare le preferenze.
- [x] **Termini di Servizio (ToS):** Redigere e pubblicare il documento.
- [x] **Diritto di Accesso (GDPR):** Implementare export dati utente.
- [x] **Diritto di Rettifica (GDPR):** Verificare che i dati siano modificabili dall'utente.
- [x] **Diritto alla Cancellazione (GDPR):** Implementare la funzione "Elimina Account".
- [ ] **Data Processing Agreement (DPA):** Stipulare DPA con i sub-processori (es. Supabase).

### 2. Sicurezza

- [x] **Crittografia Database:** Verificare che la crittografia "at-rest" di Supabase sia attiva.
- [x] **Gestione Secret:** Spostare le chiavi API in variabili d'ambiente (`.env`).
- [x] **Row-Level Security (RLS):** Abilitare e configurare RLS per tutte le tabelle sensibili.
- [x] **Audit Dipendenze:** Eseguire `npm audit fix` per correggere vulnerabilità (parzialmente risolto, vulnerabilità rimanenti non critiche).

### 3. Monetizzazione e Aspetti Commerciali

- [ ] **Gateway di Pagamento:** Integrare un provider (es. Stripe).
- [ ] **Fatturazione:** Configurare la generazione di fatture conformi alle norme UE.
- [ ] **Gestione Abbonamenti:** Implementare la logica per piani, upgrade e cancellazioni.

### 4. Esperienza Utente e Operatività

- [x] **Internazionalizzazione (i18n):** Predisporre l'app per future traduzioni.
- [x] **Accessibilità (a11y):** Verificare la conformità con le linee guida WCAG.
- [x] **Backup e Recovery:** Familiarizzare con le procedure di backup e ripristino di Supabase.
- [x] **Logging e Monitoraggio:** Integrare un servizio di monitoraggio degli errori (es. Sentry).
- [x] **Ambiente di Staging:** Creare un ambiente di test separato dalla produzione.

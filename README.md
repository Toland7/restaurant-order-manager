# 🍽️ Gestore Ordini Ristorante

Un'applicazione web moderna, intuitiva e progressiva progettata per aiutare i ristoratori a ottimizzare il processo di gestione degli ordini ai fornitori.

![App Screenshot](placeholder.png) <!-- TODO: Aggiungere uno screenshot dell'applicazione -->

## ✨ Caratteristiche Principali

- **📱 Design Mobile-First:** Ottimizzato per smartphone con un'interfaccia elegante, ispirata ad Apple, reattiva e touch-friendly.
- **🛒 Gestione Ordini Semplificata:**
    - Crea rapidamente ordini per uno o più fornitori contemporaneamente.
    - Seleziona fornitori e prodotti dal tuo database personalizzato.
    - Invia automaticamente gli ordini tramite WhatsApp, Email o SMS.
    - Mantieni una cronologia completa di tutti i tuoi ordini passati.
- **👥 Gestione Fornitori e Prodotti:**
    - Crea e gestisci un database personalizzato dei tuoi fornitori.
    - Per ogni fornitore, puoi definire un elenco di prodotti, un modello di messaggio personalizzato e più metodi di contatto.
- **📅 Programmazione Ordini:**
    - Utilizza il calendario per programmare gli ordini per una data e un'ora future.
    - L'applicazione invierà automaticamente gli ordini all'ora programmata.
- **📊 Analisi e Report:**
    - Una dashboard completa fornisce statistiche sui tuoi ordini.
    - Esporta i tuoi dati per ulteriori analisi.
    - Filtri avanzati nella cronologia degli ordini per trovare ciò di cui hai bisogno.
- **👥 Gestione Multi-Profilo/Team (PRO):**
    - Crea più profili per i membri del tuo team.
    - Imposta diverse autorizzazioni per ogni profilo.
    - Accesso sicuro con un PIN per ogni profilo.
- **📱 Progressive Web App (PWA):**
    - Installa l'applicazione direttamente dal tuo browser su qualsiasi dispositivo.
    - Utilizza l'app anche quando sei offline, grazie alla cache locale.
    - Aggiornamenti automatici all'ultima versione.

## 👑 Gratuito vs. PRO

Questa applicazione offre due livelli: una versione gratuita per l'uso di base e una versione PRO con funzionalità avanzate.

| Funzionalità                 | Gratuito   | PRO        |
| ---------------------------- | ---------- | ---------- |
| Fornitori Illimitati         | ✅         | ✅         |
| Prodotti Illimitati          | ✅         | ✅         |
| Ordini Illimitati            | ✅         | ✅         |
| Singolo Fornitore per Ordine | ✅         | ✅         |
| **Ordini Multi-Fornitore**   | ❌         | ✅         |
| **Programmazione Ordini**    | ✅         | ✅         |
| **Dashboard Analitica**      | ❌         | ✅         |
| **Gestione Team**            | ❌         | ✅         |
| **Esportazione Dati**        | ❌         | ✅         |

## 🛠️ Stack Tecnologico

- **Frontend:** [React](https://reactjs.org/)
- **Backend e Database:** [Supabase](https://supabase.com/)
- **Stilizzazione:** [Tailwind CSS](https://tailwindcss.com/)
- **Componenti UI:** Componenti personalizzati, con alcune ispirazioni da [shadcn/ui](https://ui.shadcn.com/).
- **Deployment:** [Vercel](https://vercel.com/)

## 🚀 Per Iniziare

Per avere una copia locale funzionante, segui questi semplici passaggi.

### Prerequisiti

- [Node.js](https://nodejs.org/) (v16 o successiva)
- [npm](https://www.npmjs.com/)

### Installazione

1.  **Clona il repository**
    ```sh
    git clone https://github.com/your-username/restaurant-order-manager.git
    cd restaurant-order-manager
    ```
2.  **Installa i pacchetti NPM**
    ```sh
    npm install
    ```
3.  **Configura Supabase**
    1.  Crea un nuovo progetto su [Supabase](https://supabase.com).
    2.  Vai all'**Editor SQL** nella dashboard del tuo progetto Supabase.
    3.  Esegui il contenuto del file `supabase/migrations/20251014163000_current_remote_schema.sql` per creare lo schema del database.
    4.  Vai su **Settings > API** per ottenere l'URL del tuo progetto e la chiave anonima.
    5.  Crea un file `.env` nella root del progetto e aggiungi le tue credenziali Supabase:
        ```env
        REACT_APP_SUPABASE_URL=https://your-project-url.supabase.co
        REACT_APP_SUPABASE_ANON_KEY=your-anon-key
        ```
4.  **Avvia l'applicazione**
    ```sh
    npm start
    ```

## 🗃️ Schema del Database

Il database è costruito su Supabase (PostgreSQL) e utilizza la Row Level Security (RLS) per garantire la privacy dei dati. Ecco le tabelle principali:

-   `profiles`: Memorizza le informazioni del profilo utente.
-   `suppliers`: Contiene l'elenco dei fornitori, i loro dettagli di contatto e i modelli di messaggio.
-   `products`: Un elenco di prodotti associati a ciascun fornitore.
-   `orders`: Registra tutti gli ordini inviati, inclusi il messaggio dell'ordine e lo stato.
-   `order_items`: Una tabella di giunzione che collega gli ordini ai prodotti inclusi in essi.
-   `scheduled_orders`: Memorizza gli ordini che devono essere inviati in futuro.
-   `companies`: Gestisce le aziende per account multi-utente.
-   `in_app_profiles`: Gestisce i profili all'interno di un'azienda per la gestione del team.

## 🌟 Funzionalità Future

- [ ] Integrazione API WhatsApp Business
- [ ] Notifiche Push Native
- [ ] Backup Automatici
- [ ] Supporto Multi-lingua
- [ ] App Mobile Nativa (React Native o Flutter)
- [ ] Integrazioni POS

## 🤝 Contribuire

I contributi sono ciò che rende la comunità open source un luogo così straordinario per imparare, ispirare e creare. Qualsiasi contributo tu dia è **molto apprezzato**.

1.  Forka il Progetto
2.  Crea il tuo Branch di Funzionalità (`git checkout -b feature/AmazingFeature`)
3.  Commit le tue Modifiche (`git commit -m 'Aggiungi qualche AmazingFeature'`)
4.  Push al Branch (`git push origin feature/AmazingFeature`)
5.  Apri una Pull Request

## 📄 Licenza

Distribuito sotto Licenza MIT. Vedi `LICENSE` per maggiori informazioni.

## 📞 Contatti

Link del Progetto: [https://github.com/your-username/restaurant-order-manager](https://github.com/your-username/restaurant-order-manager)

---

**Sviluppato con ❤️ per semplificare la vita dei ristoratori.**

# 🍽️ Gestione Ordini Ristorante

Una piattaforma moderna e intuitiva per gestire gli ordini dai fornitori, progettata specificamente per ristoratori che vogliono semplificare il processo di ordinazione.

## ✨ Caratteristiche

### 📱 **Mobile-First Design**
- Design ottimizzato per smartphone
- Interfaccia elegante in stile Apple
- Responsive e touch-friendly

### 🛒 **Gestione Ordini**
- Creazione rapida degli ordini
- Selezione fornitori e prodotti
- Invio automatico via WhatsApp, Email o SMS
- Cronologia completa degli ordini

### 👥 **Gestione Fornitori**
- Database fornitori personalizzato
- Gestione prodotti per fornitore
- Template messaggi personalizzabili
- Metodi di contatto multipli

### 📅 **Programmazione Ordini**
- Calendario per ordini futuri
- Promemoria automatici
- Orari di invio personalizzabili

### 📊 **Analytics & Reports**
- Dashboard con statistiche
- Esportazione dati
- Filtri avanzati nella cronologia

## 🚀 Deploy Rapido

### 1. **Clona il Repository**
```bash
git clone https://github.com/tuo-username/restaurant-order-manager.git
cd restaurant-order-manager
npm install
```

### 2. **Configura Supabase**

1. Crea un nuovo progetto su [Supabase](https://supabase.com)
2. Vai in Settings > API per ottenere le tue chiavi
3. Esegui il file SQL `supabase/migrations/001_initial_schema.sql` nell'SQL Editor
4. Copia `.env.example` in `.env` e compila:

```bash
cp .env.example .env
```

Modifica `.env`:
```env
REACT_APP_SUPABASE_URL=https://your-project.supabase.co
REACT_APP_SUPABASE_ANON_KEY=your-anon-key
```

### 3. **Deploy su Vercel**

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/tuo-username/restaurant-order-manager)

**Oppure manualmente:**

```bash
npm install -g vercel
npm run build
vercel --prod
```

## 🛠️ Sviluppo Locale

```bash
# Installa dipendenze
npm install

# Avvia in modalità sviluppo
npm start

# Build per produzione
npm run build

# Test
npm test
```

## 📁 Struttura del Progetto

```
restaurant-order-manager/
├── public/                 # File statici
├── src/
│   ├── lib/               # Configurazione Supabase
│   ├── App.js            # Componente principale
│   ├── App.css           # Stili personalizzati
│   └── index.js          # Entry point
├── supabase/
│   └── migrations/       # Script SQL database
├── .env.example          # Template variabili ambiente
├── package.json          # Dipendenze e script
└── README.md            # Documentazione
```

## 🔐 Sicurezza

- **Row Level Security (RLS)** abilitato su tutte le tabelle
- **Autenticazione** gestita da Supabase Auth
- **Autorizzazione** basata su utente
- **Validazione** sia client che server-side

## 🌟 Funzionalità Future

- [ ] Integrazione API WhatsApp Business
- [ ] Notifiche push native
- [ ] Backup automatici
- [ ] Multi-lingua
- [ ] App mobile nativa
- [ ] Gestione team
- [ ] Integrazioni con POS

## 📱 Progressive Web App (PWA)

L'applicazione è configurata come PWA e può essere:
- **Installata** direttamente da browser
- **Utilizzata offline** (cache locale)
- **Aggiornata automaticamente**

## 🤝 Contribuire

1. Fork il progetto
2. Crea il tuo feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit le modifiche (`git commit -m 'Add some AmazingFeature'`)
4. Push al branch (`git push origin feature/AmazingFeature`)
5. Apri una Pull Request

## 📄 Licenza

Distribuito sotto licenza MIT. Vedi `LICENSE` per maggiori informazioni.

## 📞 Supporto

- **Email**: support@tuodominio.com
- **Issues**: [GitHub Issues](https://github.com/tuo-username/restaurant-order-manager/issues)
- **Documentazione**: [Wiki](https://github.com/tuo-username/restaurant-order-manager/wiki)

## 🎯 Target

Perfetto per:
- **Ristoratori** che vogliono digitalizzare gli ordini
- **Piccole catene** di ristorazione  
- **Trattorie** e **pizzerie**
- **Bar** e **caffetterie**

---

**Sviluppato con ❤️ per semplificare la vita dei ristoratori italiani**
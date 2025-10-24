# Ambiente di Staging

## Setup
1. Crea progetto Supabase staging: `restaurant-order-manager-staging`.
2. Copia schema da produzione: `supabase db dump --db-url prod-url > schema.sql` poi applica a staging.
3. Aggiorna `.env.staging` con URL e chiavi Supabase staging.
4. Build staging: `npm run build:staging`.
5. Deploy build su hosting staging (Vercel/Netlify con branch staging).

## Test
- Verifica funzionalità senza dati produzione.
- Monitora errori su Sentry progetto staging.

## Deploy Produzione
- Dopo test, merge branch staging in main.
- Build produzione: `npm run build`.
- Deploy su hosting produzione.
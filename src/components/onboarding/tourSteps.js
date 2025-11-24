// Tour steps configuration for onboarding
export const getTourSteps = (isProUser, isMobile = false) => {
  const steps = [
    {
      id: 'welcome',
      title: '👋 Benvenuto!',
      description: 'Benvenuto nel Gestore Ordini Ristorante! Ti guideremo attraverso le funzionalità principali per aiutarti a iniziare.',
      target: null,
      position: 'center',
      action: null,
    },
  ];

  if (isMobile) {
    // Mobile-specific tour steps (targets MenuButtons on HomePage)
    steps.push(
      {
        id: 'create-order',
        title: '📝 Crea Ordini',
        description: 'Tocca qui per creare e inviare ordini ai tuoi fornitori. Seleziona i prodotti, specifica le quantità e invia via email o WhatsApp.',
        target: '[data-tour="create-order-mobile"]',
        position: 'top',
        action: { type: 'navigate', path: '/' },
      },
      {
        id: 'suppliers',
        title: '🏪 Gestisci Fornitori',
        description: 'Aggiungi e gestisci i tuoi fornitori. Puoi salvare i loro contatti, prodotti disponibili e preferenze di comunicazione.',
        target: '[data-tour="suppliers-mobile"]',
        position: 'top',
        action: { type: 'navigate', path: '/' },
      },
      {
        id: 'schedule',
        title: '📅 Programma Ordini',
        description: 'Pianifica gli ordini in anticipo! Riceverai notifiche di promemoria per inviarli al momento giusto.',
        target: '[data-tour="schedule-mobile"]',
        position: 'top',
        action: { type: 'navigate', path: '/' },
      },
      {
        id: 'notifications',
        title: '🔔 Notifiche',
        description: 'Ricevi promemoria per gli ordini programmati. Tocca l\'icona della campanella in alto per visualizzare le notifiche.',
        target: '[data-tour="notifications-mobile"]',
        position: 'bottom',
        action: { type: 'navigate', path: '/' },
      }
    );

    if (isProUser) {
      steps.push({
        id: 'analytics',
        title: '📊 Analytics PRO',
        description: 'Analizza i tuoi ordini con grafici dettagliati. Tocca l\'icona del grafico in alto per accedere.',
        target: '[data-tour="analytics-mobile"]',
        position: 'bottom',
        action: { type: 'navigate', path: '/' },
      });
    }
  } else {
    // Desktop-specific tour steps (targets sidebar items)
    steps.push(
      {
        id: 'create-order',
        title: '📝 Crea Ordini',
        description: 'Qui puoi creare e inviare ordini ai tuoi fornitori. Seleziona i prodotti, specifica le quantità e invia via email o WhatsApp.',
        target: '[data-tour="create-order"]',
        position: 'right',
        action: { type: 'navigate', path: '/' },
        highlightSidebar: true,
      },
      {
        id: 'suppliers',
        title: '🏪 Gestisci Fornitori',
        description: 'Aggiungi e gestisci i tuoi fornitori. Puoi salvare i loro contatti, prodotti disponibili e preferenze di comunicazione.',
        target: '[data-tour="suppliers"]',
        position: 'right',
        action: { type: 'navigate', path: '/' },
        highlightSidebar: true,
      },
      {
        id: 'schedule',
        title: '📅 Programma Ordini',
        description: 'Pianifica gli ordini in anticipo! Riceverai notifiche di promemoria per inviarli al momento giusto.',
        target: '[data-tour="schedule"]',
        position: 'right',
        action: { type: 'navigate', path: '/' },
        highlightSidebar: true,
      },
      {
        id: 'notifications',
        title: '🔔 Notifiche',
        description: 'Ricevi promemoria per gli ordini programmati. Non perdere mai una scadenza importante!',
        target: '[data-tour="notifications"]',
        position: 'right',
        action: { type: 'navigate', path: '/' },
        highlightSidebar: true,
      }
    );

    if (isProUser) {
      steps.push({
        id: 'analytics',
        title: '📊 Analytics PRO',
        description: 'Analizza i tuoi ordini con grafici dettagliati. Monitora le spese, i fornitori più utilizzati e le tendenze nel tempo.',
        target: '[data-tour="analytics"]',
        position: 'right',
        action: { type: 'navigate', path: '/' },
        highlightSidebar: true,
      });
    }
  }

  steps.push({
    id: 'complete',
    title: '🎉 Tutto Pronto!',
    description: 'Ora sei pronto per iniziare! Puoi sempre riavviare questa guida dalle Impostazioni.',
    target: null,
    position: 'center',
    action: null,
  });

  return steps;
};


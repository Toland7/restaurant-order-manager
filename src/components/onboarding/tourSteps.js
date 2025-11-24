// Tour steps configuration for onboarding
export const getTourSteps = (isProUser) => {
  const steps = [
    {
      id: 'welcome',
      title: '👋 Benvenuto!',
      description: 'Benvenuto nel Gestore Ordini Ristorante! Ti guideremo attraverso le funzionalità principali per aiutarti a iniziare.',
      target: null, // No specific target, just a welcome message
      position: 'center',
      action: null,
    },
    {
      id: 'create-order',
      title: '📝 Crea Ordini',
      description: 'Qui puoi creare e inviare ordini ai tuoi fornitori. Seleziona i prodotti, specifica le quantità e invia via email o WhatsApp.',
      target: '[data-tour="create-order"]',
      position: 'bottom',
      action: { type: 'navigate', path: '/' },
      highlightSidebar: true,
    },
    {
      id: 'suppliers',
      title: '🏪 Gestisci Fornitori',
      description: 'Aggiungi e gestisci i tuoi fornitori. Puoi salvare i loro contatti, prodotti disponibili e preferenze di comunicazione.',
      target: '[data-tour="suppliers"]',
      position: 'bottom',
      action: { type: 'navigate', path: '/' },
      highlightSidebar: true,
    },
    {
      id: 'schedule',
      title: '📅 Programma Ordini',
      description: 'Pianifica gli ordini in anticipo! Imposta data e ora per l\'invio automatico degli ordini ricorrenti.',
      target: '[data-tour="schedule"]',
      position: 'bottom',
      action: { type: 'navigate', path: '/' },
      highlightSidebar: true,
    },
    {
      id: 'notifications',
      title: '🔔 Notifiche',
      description: 'Ricevi promemoria per gli ordini programmati. Non perdere mai una scadenza importante!',
      target: '[data-tour="notifications"]',
      position: 'bottom',
      action: { type: 'navigate', path: '/' },
      highlightSidebar: true,
    },
  ];

  // Add analytics step only for PRO users
  if (isProUser) {
    steps.push({
      id: 'analytics',
      title: '📊 Analytics PRO',
      description: 'Analizza i tuoi ordini con grafici dettagliati. Monitora le spese, i fornitori più utilizzati e le tendenze nel tempo.',
      target: '[data-tour="analytics"]',
      position: 'bottom',
      action: { type: 'navigate', path: '/' },
      highlightSidebar: true,
    });
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

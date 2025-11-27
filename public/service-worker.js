/* eslint-disable no-restricted-globals */
/* eslint-disable no-undef */

// VERSIONE: 1.3.0 - Rimosso postMessage, aggiunto forceReauth come parametro URL
console.log('[Service Worker] Versione 1.3.0 caricata');

self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    console.log('[Service Worker] SKIP_WAITING ricevuto, attivazione immediata');
    self.skipWaiting();
  }
});

// Assicura che il nuovo service worker prenda il controllo immediatamente dopo l'attivazione
self.addEventListener('activate', (event) => {
  console.log('[Service Worker] Attivato');
  event.waitUntil(self.clients.claim());
});

self.addEventListener('push', event => {
  console.log('[Service Worker] Evento push ricevuto');

  try {
    const data = event.data.json();
    console.log('[Service Worker] Dati push:', data);
    const title = data.title || 'Nuova Notifica';
    const options = {
      body: data.body || 'Hai ricevuto una nuova notifica.',
      icon: '/logo192.svg',
      badge: '/logo192.svg',
      data: data.data // Passa l'oggetto dati
    };
    event.waitUntil(self.registration.showNotification(title, options));
  } catch (e) {
    console.error('[Service Worker] Errore nell\'elaborazione dell\'evento push', e);
    const title = 'Nuova Notifica';
    const options = {
      body: event.data.text(),
      icon: '/logo192.svg',
      badge: '/logo192.svg'
    };
    event.waitUntil(self.registration.showNotification(title, options));
  }
});

self.addEventListener('notificationclick', event => {
  console.log('[Service Worker] Notifica cliccata');

  event.notification.close();

  // Estrai i dati della notifica
  const notificationData = event.notification.data || {};
  const forceReauth = notificationData.forceReauth || false;
  console.log('[Service Worker] Dati notifica:', notificationData);
  console.log('[Service Worker] Flag forceReauth:', forceReauth);

  let targetUrl = new URL('/', self.location.origin); // Inizia con l\'URL base

  // Costruisci l\'URL target in base ai dati della notifica
  if (notificationData.url) {
    targetUrl = new URL(notificationData.url, self.location.origin);
  } else if (notificationData.reminder_id) {
    targetUrl.pathname = '/create-order';
    targetUrl.searchParams.set('reminder_id', notificationData.reminder_id);
    targetUrl.searchParams.set('flowInitialStep', 'review');
  } else if (notificationData.reminder_ids) {
    targetUrl.pathname = '/create-order';
    const ids = Array.isArray(notificationData.reminder_ids) ? JSON.stringify(notificationData.reminder_ids) : notificationData.reminder_ids;
    targetUrl.searchParams.set('reminder_ids', ids);
    targetUrl.searchParams.set('flowInitialStep', 'review');
  } else if (notificationData.batch_id && notificationData.user_id) {
    targetUrl.pathname = '/create-order';
    targetUrl.searchParams.set('batch_id', notificationData.batch_id);
    targetUrl.searchParams.set('user_id', notificationData.user_id);
    targetUrl.searchParams.set('flowInitialStep', 'review');
  }

  // Aggiungi il flag forceReauth all\'URL se necessario
  if (forceReauth) {
    targetUrl.searchParams.set('forceReauth', 'true');
  }

  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then(clientList => {
      // Cerca un client esistente da riutilizzare
      let clientToHandle = null;
      for (const client of clientList) {
        if (client.url.startsWith(self.location.origin)) {
          clientToHandle = client;
          break;
        }
        // Fallback to first client if no exact match or focused client
        if (!clientToHandle) clientToHandle = clientList[0];
      }

      if (clientToHandle) {
        // Se un client esiste, naviga a quell\'URL e portalo in primo piano
        console.log('[Service Worker] Navigazione client esistente a URL:', targetUrl.href);
        return clientToHandle.navigate(targetUrl.href).then(c => c?.focus());
      } else {
        // Altrimenti, apri una nuova finestra
        console.log('[Service Worker] Apertura nuova finestra con URL:', targetUrl.href);
        return clients.openWindow(targetUrl.href);
      }
    })
  );
});

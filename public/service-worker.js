/* eslint-disable no-restricted-globals */
/* eslint-disable no-undef */

// VERSIONE: 1.2.0 - Migliorata gestione navigationclick per navigazione esplicita
console.log('[Service Worker] Versione 1.2.0 caricata');

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
      data: data.data // Passa l\'oggetto dati
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
  console.log('[Service Worker] Dati notifica:', notificationData);
  console.log('[Service Worker] Flag forceReauth:', notificationData.forceReauth);

  let targetUrl = new URL('/', self.location.origin); // Inizia con l\'URL base

  // Costruisci l\'URL target in base ai dati della notifica
  if (notificationData.url) {
    // Se c\'è un URL specifico nella notifica, usalo
    targetUrl = new URL(notificationData.url, self.location.origin);
  } else if (notificationData.reminder_id) {
    targetUrl.pathname = '/create-order';
    targetUrl.searchParams.set('notification_reminder_id', notificationData.reminder_id);
    targetUrl.searchParams.set('flowInitialStep', 'review'); // Logica da MainApp.js
  } else if (notificationData.reminder_ids) {
    targetUrl.pathname = '/create-order';
    // notification_reminder_ids in MainApp.js si aspetta una stringa JSON o separata da virgole
    const ids = Array.isArray(notificationData.reminder_ids) ? JSON.stringify(notificationData.reminder_ids) : notificationData.reminder_ids;
    targetUrl.searchParams.set('notification_reminder_ids', ids);
    targetUrl.searchParams.set('flowInitialStep', 'review'); // Logica da MainApp.js
  } else if (notificationData.batch_id && notificationData.user_id) {
    targetUrl.pathname = '/create-order';
    targetUrl.searchParams.set('notification_batch_id', notificationData.batch_id);
    targetUrl.searchParams.set('notification_user_id', notificationData.user_id);
    targetUrl.searchParams.set('flowInitialStep', 'review'); // Logica da MainApp.js
  }

  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then(clientList => {
      let clientToHandle = null;

      // Cerca un client esistente che possiamo navigare o mettere a fuoco
      for (const client of clientList) {
        // Se troviamo un client che è già nella nostra origine, preferiamo usarlo
        if (client.url.startsWith(self.location.origin)) {
          clientToHandle = client;
          break;
        }
      }

      const messagePayload = {
        type: 'NOTIFICATION_CLICKED',
        data: notificationData,
        forceReauth: notificationData.forceReauth || false
      };

      if (clientToHandle) {
        // Client esistente trovato: naviga all\'URL target e poi invia il messaggio
        console.log('[Service Worker] Navigazione client esistente a URL:', targetUrl.href);
        return clientToHandle.navigate(targetUrl.href).then(c => {
          if (c) { // c è il client dopo la navigazione, se ha successo
            c.focus(); // Porta in primo piano
            console.log('[Service Worker] Invio postMessage al client con forceReauth:', messagePayload.forceReauth);
            c.postMessage(messagePayload);
          } else {
            console.warn('[Service Worker] Navigazione fallita per client esistente (forse il client si è chiuso?), apro nuova finestra.');
            // Fallback: se navigate non restituisce un client valido, apri una nuova finestra
            clients.openWindow(targetUrl.href).then(newWindowClient => {
              if (newWindowClient) {
                console.log('[Service Worker] Invio postMessage alla nuova finestra con forceReauth:', messagePayload.forceReauth);
                newWindowClient.postMessage(messagePayload);
              }
            });
          }
        }).catch(error => {
          console.error('[Service Worker] Errore durante la navigazione del client esistente:', error);
          // Fallback: apri una nuova finestra se la navigazione fallisce
          clients.openWindow(targetUrl.href).then(newWindowClient => {
            if (newWindowClient) {
              console.log('[Service Worker] Invio postMessage alla nuova finestra con forceReauth:', messagePayload.forceReauth);
              newWindowClient.postMessage(messagePayload);
            }
          });
        });
      } else {
        // Nessun client esistente trovato: apri una nuova finestra e invia il messaggio
        console.log('[Service Worker] Apertura nuova finestra con URL:', targetUrl.href);
        return clients.openWindow(targetUrl.href).then(newWindowClient => {
          if (newWindowClient) {
            console.log('[Service Worker] Invio postMessage alla nuova finestra con forceReauth:', messagePayload.forceReauth);
            newWindowClient.postMessage(messagePayload);
          }
        });
      }
    })
  );
});
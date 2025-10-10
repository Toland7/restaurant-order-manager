/* eslint-disable no-restricted-globals */

let pendingNavigation = null;

self.addEventListener('push', event => {
  console.log('[Service Worker] Push Received.');
  try {
    const data = event.data.json();
    const title = data.title || 'Nuova Notifica';
    const options = {
      body: data.body || 'Hai ricevuto una nuova notifica.',
      icon: '/logo192.svg',
      badge: '/logo192.svg',
      data: data.data // Pass along the data object
    };
    event.waitUntil(self.registration.showNotification(title, options));
  } catch (e) {
    console.error('[Service Worker] Error processing push event', e);
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
  console.log('[Service Worker] Notification click Received.');
  if (event.notification.data && event.notification.data.url) {
    pendingNavigation = event.notification.data.url;
  }
  event.notification.close();

  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then(clientList => {
      const client = clientList.find(c => c.visibilityState === 'visible');
      if (client) {
        return client.focus();
      } else {
        return clients.openWindow('/');
      }
    })
  );
});

self.addEventListener('message', event => {
  if (event.data && event.data.type === 'get_pending_navigation') {
    if (pendingNavigation) {
      const client = event.source;
      if (client) {
        client.postMessage({ type: 'navigate', url: pendingNavigation });
      }
      pendingNavigation = null; // Clear after sending
    }
  }
});
/* eslint-disable no-restricted-globals */

self.addEventListener('push', event => {
  console.log('[Service Worker] Push Received.');
  try {
    const data = event.data.json();
    const title = data.title || 'Nuova Notifica';
    const options = {
      body: data.body || 'Hai ricevuto una nuova notifica.',
      icon: '/logo192.png', // Assumes an icon in the public folder
      badge: '/logo192.png'
    };
    event.waitUntil(self.registration.showNotification(title, options));
  } catch (e) {
    console.error('[Service Worker] Error processing push event', e);
    const title = 'Nuova Notifica';
    const options = {
      body: event.data.text(),
      icon: '/logo192.png',
      badge: '/logo192.png'
    };
    event.waitUntil(self.registration.showNotification(title, options));
  }
});

self.addEventListener('notificationclick', event => {
  console.log('[Service Worker] Notification click Received.');

  event.notification.close();

  event.waitUntil(
    clients.matchAll({ type: 'window' }).then(clientList => {
      for (const client of clientList) {
        if (client.url === '/' && 'focus' in client) {
          return client.focus();
        }
      }
      if (clients.openWindow) {
        return clients.openWindow('/');
      }
    })
  );
});

/* eslint-disable no-restricted-globals */

self.addEventListener('push', event => {
  console.log('[Service Worker] Push Received.');
  try {
    const data = event.data.json();
    const title = data.title || 'Nuova Notifica';
    const options = {
      body: data.body || 'Hai ricevuto una nuova notifica.',
      icon: '/logo192.svg',
      badge: '/logo192.svg'
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
  console.log('[Service Worker] Notification click Received.', event.notification.data);

  const urlToOpen = new URL(event.notification.data.url, self.location.origin).href;

  event.notification.close();

  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then(clientList => {
      if (clientList.length > 0) {
        let client = clientList[0];
        for (const c of clientList) {
          if (c.focused) {
            client = c;
          }
        }
        client.navigate(urlToOpen);
        return client.focus();
      } else {
        return clients.openWindow(urlToOpen);
      }
    })
  );
});

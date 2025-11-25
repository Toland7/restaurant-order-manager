/* eslint-disable no-restricted-globals */
/* eslint-disable no-undef */

self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting();
  }
});

self.addEventListener('push', event => {

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

  event.notification.close();

  // Extract notification data
  const notificationData = event.notification.data || {};

  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then(clientList => {
      // Always navigate to home page
      const homeUrl = new URL('/', self.location.origin);
      
      if (clientList.length > 0) {
        let client = clientList.find(c => c.focused);
        if (!client) client = clientList[0];
        
        // Send notification data to the client via postMessage
        client.postMessage({
          type: 'NOTIFICATION_CLICKED',
          data: notificationData
        });
        
        return client.navigate(homeUrl.href).then(c => c.focus());
      }
      
      // If no client exists, encode notification data in URL
      if (notificationData.url) {
        homeUrl.searchParams.set('notification_url', notificationData.url);
      } else if (notificationData.reminder_id) {
        homeUrl.searchParams.set('notification_reminder_id', notificationData.reminder_id);
      } else if (notificationData.reminder_ids) {
        homeUrl.searchParams.set('notification_reminder_ids', JSON.stringify(notificationData.reminder_ids));
      }
      
      return clients.openWindow(homeUrl.href);
    })
  );
});

/* eslint-disable no-restricted-globals */
/* eslint-disable no-undef */

// VERSION: 1.1.0 - Added forceReauth support
console.log('[Service Worker] Version 1.1.0 loaded');

self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    console.log('[Service Worker] SKIP_WAITING received, activating immediately');
    self.skipWaiting();
  }
});

// Ensure the new service worker takes control immediately after activation
self.addEventListener('activate', (event) => {
  console.log('[Service Worker] Activated');
  event.waitUntil(self.clients.claim());
});

self.addEventListener('push', event => {
  console.log('[Service Worker] Push event received');

  try {
    const data = event.data.json();
    console.log('[Service Worker] Push data:', data);
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
  console.log('[Service Worker] Notification clicked');

  event.notification.close();

  // Extract notification data
  const notificationData = event.notification.data || {};
  console.log('[Service Worker] Notification data:', notificationData);
  console.log('[Service Worker] forceReauth flag:', notificationData.forceReauth);

  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then(clientList => {
      // Always navigate to home page
      const homeUrl = new URL('/', self.location.origin);
      
      if (clientList.length > 0) {
        let client = clientList.find(c => c.focused);
        if (!client) client = clientList[0];
        
        // Send notification data to the client via postMessage
        console.log('[Service Worker] Sending postMessage to client with forceReauth:', notificationData.forceReauth);
        client.postMessage({
          type: 'NOTIFICATION_CLICKED',
          data: notificationData,
          forceReauth: notificationData.forceReauth || false
        });
        
        // Try to navigate, but handle error if service worker is not active
        return client.navigate(homeUrl.href).then(c => c.focus()).catch(error => {
          console.error('[Service Worker] Navigation failed:', error);
          // If navigation fails, open a new window with notification data in URL
          if (notificationData.url) {
            homeUrl.searchParams.set('notification_url', notificationData.url);
          } else if (notificationData.reminder_id) {
            homeUrl.searchParams.set('notification_reminder_id', notificationData.reminder_id);
          } else if (notificationData.reminder_ids) {
            homeUrl.searchParams.set('notification_reminder_ids', JSON.stringify(notificationData.reminder_ids));
          }
          return clients.openWindow(homeUrl.href);
        });
      }
      
      // If no client exists, encode notification data in URL
      if (notificationData.url) {
        homeUrl.searchParams.set('notification_url', notificationData.url);
      } else if (notificationData.reminder_id) {
        homeUrl.searchParams.set('notification_reminder_id', notificationData.reminder_id);
      } else if (notificationData.reminder_ids) {
        homeUrl.searchParams.set('notification_reminder_ids', JSON.stringify(notificationData.reminder_ids));
      }
      
      console.log('[Service Worker] Opening new window with URL:', homeUrl.href);
      return clients.openWindow(homeUrl.href);
    })
  );
});

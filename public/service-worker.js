/* eslint-disable no-restricted-globals */



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

  let urlToOpen = '/'; // Default URL

  if (event.notification.data) {
    if (event.notification.data.url) {
      urlToOpen = new URL(event.notification.data.url, self.location.origin).href;
    } else if (event.notification.data.reminder_id) {
      // Construct the URL for the reminder
      urlToOpen = new URL(`/reminders/${event.notification.data.reminder_id}`, self.location.origin).href;
    }
  }

  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then(clientList => {
      if (clientList.length > 0) {
        let client = clientList.find(c => c.focused);
        if (!client) client = clientList[0];
        return client.navigate(urlToOpen).then(c => c.focus());
      }
      return clients.openWindow(urlToOpen);
    })
  );
});

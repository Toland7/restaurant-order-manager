const { createClient } = require('@supabase/supabase-js');
const webpush = require('web-push');

// Initialize Supabase client
const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

// Initialize web-push
webpush.setVapidDetails(
  'mailto:your-email@example.com', // Replace with your email
  process.env.VAPID_PUBLIC_KEY,
  process.env.VAPID_PRIVATE_KEY
);

module.exports = async (req, res) => {
  if (req.method !== 'POST') {
    res.setHeader('Allow', 'POST');
    return res.status(405).end('Method Not Allowed');
  }

  const { authorization } = req.headers;
  if (authorization !== `Bearer ${process.env.CRON_SECRET}`) {
    return res.status(401).json({ error: 'Unauthorized' });
  }

  try {
    const now = new Date();
    const today = now.toISOString().split('T')[0];
    const currentTime = now.toTimeString().split(' ')[0].substring(0, 5); // HH:MM format

    // 1. Fetch due and unsent reminders with user profiles
    const { data: reminders, error: remindersError } = await supabase
      .from('scheduled_orders')
      .select(`
        *,
        profiles ( push_subscription ),
        suppliers ( name )
      `)
      .eq('scheduled_date', today)
      .eq('is_sent', false)
      .lte('time_to_send', currentTime);

    if (remindersError) {
      throw remindersError;
    }

    if (!reminders || reminders.length === 0) {
      return res.status(200).json({ message: 'No reminders to send.' });
    }

    const notificationsToSend = reminders.map(reminder => {
      // The profiles table returns an array, get the first one.
      const subscription = reminder.profiles[0]?.push_subscription;
      
      if (!subscription) {
        return Promise.resolve({ status: 'no-subscription', reminderId: reminder.id });
      }

      const payload = JSON.stringify({
        title: `Promemoria Ordine: ${reminder.suppliers.name}`,
        body: reminder.reminder_type === 'prefilled' 
          ? 'Il tuo ordine precompilato è pronto per essere inviato.' 
          : `È ora di fare l'ordine per ${reminder.suppliers.name}!`,
        data: { url: `/reminders/${reminder.id}` }
      });

      return webpush.sendNotification(subscription, payload)
        .then(() => ({ status: 'success', reminderId: reminder.id }))
        .catch(err => ({ status: 'error', reminderId: reminder.id, error: err.body }));
    });

    const results = await Promise.all(notificationsToSend);

    const sentIds = results
      .filter(r => r.status === 'success')
      .map(r => r.reminderId);

    if (sentIds.length > 0) {
      await supabase
        .from('scheduled_orders')
        .update({ is_sent: true })
        .in('id', sentIds);
    }

    res.status(200).json({ message: 'Reminders processed.', results });

  } catch (error) {
    console.error('Error processing reminders:', error);
    res.status(500).json({ error: error.message });
  }
};

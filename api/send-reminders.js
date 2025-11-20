const { createClient } = require('@supabase/supabase-js');
const webpush = require('web-push');
const fetch = require('node-fetch'); // Explicitly import fetch

// Initialize Supabase client
const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
  { global: { fetch: fetch, timeout: 10000 } } // Pass the imported fetch
);

// Initialize web-push
webpush.setVapidDetails(
  process.env.VAPID_MAILTO, // Your email for VAPID details
  process.env.VAPID_PUBLIC_KEY,
  process.env.VAPID_PRIVATE_KEY
);

// --- ADDED DIAGNOSTIC LOGGING ---
// --- END DIAGNOSTIC LOGGING ---

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
    // DIAGNOSTIC: Test direct fetch to Supabase
    try {
      const testUrl = process.env.SUPABASE_URL + '/rest/v1/suppliers?limit=1'; // Use a public endpoint if possible, or any endpoint
      const testResponse = await fetch(testUrl, {
        headers: {
          'apikey': process.env.SUPABASE_ANON_KEY, // Use anon key for this test
          'Authorization': `Bearer ${process.env.SUPABASE_ANON_KEY}`
        }
      });
      const testData = await testResponse.json();
    } catch (fetchError) {
      console.error('DIAGNOSTIC: Direct fetch failed:', fetchError);
    }

    const now = new Date();

    // 1. Fetch due and unsent reminders
    const { data: reminders, error: remindersError } = await supabase
      .from('scheduled_orders')
      .select(`
        *,
        suppliers ( name )
      `)
      .eq('is_sent', false)
      .lte('scheduled_at', now.toISOString());

    if (remindersError) {
      throw remindersError;
    }

    if (!reminders || reminders.length === 0) {
      return res.status(200).json({ message: 'No reminders to send.' });
    }

    const notificationsToSend = reminders.map(async reminder => {
      // 2. Fetch all push subscriptions for the user
      const { data: subscriptions, error: subscriptionsError } = await supabase
        .from('push_subscriptions')
        .select('subscription')
        .eq('user_id', reminder.user_id);

      if (subscriptionsError || !subscriptions || subscriptions.length === 0) {
        return { status: 'no-subscription', reminderId: reminder.id };
      }

      const payload = JSON.stringify({
        title: `Promemoria Ordine: ${reminder.suppliers.name}`,
        body: reminder.reminder_type === 'prefilled'
          ? 'Il tuo ordine precompilato è pronto per essere inviato.'
          : `È ora di fare l'ordine per ${reminder.suppliers.name}!`,
        data: { url: `/create-order?reminder_id=${reminder.id}` }
      });

      const sendPromises = subscriptions.map(sub =>
        webpush.sendNotification(sub.subscription, payload)
          .catch(err => {
            console.error(`Error sending push notification to one device for user ${reminder.user_id}:`, err);
            if (err.statusCode === 410) {
              // Subscription is expired or invalid, delete it
              supabase.from('push_subscriptions').delete().eq('subscription', sub.subscription);
            }
            return { status: 'error', error: err.body }; // Return error status for this specific device
          })
      );
      
      const results = await Promise.allSettled(sendPromises);
      const isAnySuccess = results.some(r => r.status === 'fulfilled');

      if (isAnySuccess) {
        // Insert notification only once per reminder, if at least one device was reached
        const notificationData = {
          user_id: reminder.user_id,
          title: `Promemoria Ordine: ${reminder.suppliers.name}`,
          message: `È ora di fare l'ordine per ${reminder.suppliers.name}!`,
          type: 'info',
          reminder_id: reminder.id
        };
        const { error } = await supabase.from('notifications').insert([notificationData]);
        if (error) {
          // If the notification already exists due to the unique constraint, it's not a critical error.
          // This can happen in a race condition if another process just sent it.
          if (error.code !== '23505') { // 23505 is unique_violation
            console.error('Error inserting notification:', error);
          }
        }
        return { status: 'success', reminderId: reminder.id };
      } else {
        return { status: 'all-failed', reminderId: reminder.id };
      }
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

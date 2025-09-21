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
    // DIAGNOSTIC: Test direct fetch to Supabase
    console.log('DIAGNOSTIC: Attempting direct fetch to Supabase URL...');
    try {
      const testUrl = process.env.SUPABASE_URL + '/rest/v1/suppliers?limit=1'; // Use a public endpoint if possible, or any endpoint
      const testResponse = await fetch(testUrl, {
        headers: {
          'apikey': process.env.SUPABASE_ANON_KEY, // Use anon key for this test
          'Authorization': `Bearer ${process.env.SUPABASE_ANON_KEY}`
        }
      });
      console.log('DIAGNOSTIC: Fetch response status:', testResponse.status);
      const testData = await testResponse.json();
      console.log('DIAGNOSTIC: Fetch response data:', testData);
    } catch (fetchError) {
      console.error('DIAGNOSTIC: Direct fetch failed:', fetchError);
    }
    console.log('DIAGNOSTIC: Direct fetch test complete.');

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
      // 2. Fetch the user's profile separately
      const { data: profile, error: profileError } = await supabase
        .from('profiles')
        .select('push_subscription')
        .eq('id', reminder.user_id)
        .single();

      if (profileError || !profile || !profile.push_subscription) {
        return { status: 'no-subscription', reminderId: reminder.id };
      }

      const subscription = profile.push_subscription;
      
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

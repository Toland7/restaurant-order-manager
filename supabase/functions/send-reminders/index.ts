import { createClient } from '@supabase/supabase-js';
import webpush from 'web-push';

// These should be stored as Supabase secrets
const VAPID_PUBLIC_KEY = Deno.env.get('VAPID_PUBLIC_KEY');
const VAPID_PRIVATE_KEY = Deno.env.get('VAPID_PRIVATE_KEY');

webpush.setVapidDetails(
  'mailto:your-email@example.com', // Replace with your email
  VAPID_PUBLIC_KEY,
  VAPID_PRIVATE_KEY
);

Deno.serve(async (req) => {
  const supabaseClient = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_ANON_KEY') ?? '',
    { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
  );

  const now = new Date();
  const today = now.toISOString().split('T')[0];
  const currentTime = now.toTimeString().split(' ')[0].substring(0, 5); // HH:MM format

  // 1. Fetch due and unsent reminders
  const { data: reminders, error: remindersError } = await supabaseClient
    .from('scheduled_orders')
    .select(`
      *,
      profiles (
        push_subscription
      ),
      suppliers (
        name
      )
    `)
    .eq('scheduled_date', today)
    .eq('is_sent', false)
    .lte('time_to_send', currentTime);

  if (remindersError) {
    console.error('Error fetching reminders:', remindersError);
    return new Response(JSON.stringify({ error: remindersError.message }), {
      headers: { 'Content-Type': 'application/json' },
      status: 500,
    });
  }

  if (!reminders || reminders.length === 0) {
    return new Response(JSON.stringify({ message: 'No reminders to send.' }), {
      headers: { 'Content-Type': 'application/json' },
      status: 200,
    });
  }

  const notificationsToSend = reminders.map(reminder => {
    const subscription = reminder.profiles.push_subscription;
    if (!subscription) {
      return Promise.resolve({ status: 'no-subscription', reminderId: reminder.id });
    }

    const payload = JSON.stringify({
      title: `Promemoria Ordine: ${reminder.suppliers.name}`,
      body: reminder.reminder_type === 'prefilled' 
        ? 'Il tuo ordine precompilato è pronto per essere inviato.' 
        : `È ora di fare l'ordine per ${reminder.suppliers.name}!`,
      data: {
        url: `/reminders/${reminder.id}` // URL to open on notification click
      }
    });

    return webpush.sendNotification(subscription, payload)
      .then(() => ({ status: 'success', reminderId: reminder.id }))
      .catch(err => ({ status: 'error', reminderId: reminder.id, error: err }));
  });

  const results = await Promise.all(notificationsToSend);

  const sentIds = results
    .filter(r => r.status === 'success')
    .map(r => r.reminderId);

  if (sentIds.length > 0) {
    const { error: updateError } = await supabaseClient
      .from('scheduled_orders')
      .update({ is_sent: true })
      .in('id', sentIds);

    if (updateError) {
      console.error('Error updating sent reminders:', updateError);
      // Not returning error here as notifications were already sent
    }
  }

  return new Response(JSON.stringify({ results }), {
    headers: { 'Content-Type': 'application/json' },
    status: 200,
  });
});
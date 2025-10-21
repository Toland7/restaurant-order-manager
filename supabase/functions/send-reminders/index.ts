import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

// Define interfaces for better type safety
interface Supplier {
  name: string;
}

interface ScheduledOrder {
  id: number;
  user_id: string;
  reminder_type: 'prefilled' | 'standard';
  suppliers: Supplier;
}

// The web-push library might not export PushSubscription type directly from esm.sh,
// so we define a compatible one.
interface PushSubscription {
  endpoint: string;
  keys: {
    p256dh: string;
    auth: string;
  };
}

// --- Manual Web Push Implementation --- 

// Utility functions for converting between URL-safe base64 and Uint8Array
function urlBase64ToUint8Array(base64String: string): Uint8Array {
  const padding = '='.repeat((4 - base64String.length % 4) % 4);
  const base64 = (base64String + padding)
    .replace(/\-/g, '+')
    .replace(/_/g, '/');
  const rawData = atob(base64);
  const outputArray = new Uint8Array(rawData.length);
  for (let i = 0; i < rawData.length; ++i) {
    outputArray[i] = rawData.charCodeAt(i);
  }
  return outputArray;
}

function uint8ArrayToBase64Url(uint8Array: Uint8Array): string {
  return btoa(String.fromCharCode.apply(null, Array.from(uint8Array)))
    .replace(/\+/g, '-')
    .replace(/\//g, '_')
    .replace(/=+$/, '');
}

// Function to generate VAPID headers
async function generateVapidHeaders(
  endpoint: string,
  privateKey: string,
  publicKey: string,
  mailto: string
): Promise<{ Authorization: string; 'Crypto-Key': string }> {
  const aud = new URL(endpoint).origin;
  const exp = Math.floor(Date.now() / 1000) + (12 * 60 * 60); // 12 hours expiration

  const header = {
    typ: 'JWT',
    alg: 'ES256',
  };

  const claims = {
    aud: aud,
    exp: exp,
    sub: mailto,
  };

  const jwtHeader = uint8ArrayToBase64Url(new TextEncoder().encode(JSON.stringify(header)));
  const jwtClaims = uint8ArrayToBase64Url(new TextEncoder().encode(JSON.stringify(claims)));
  const unsignedToken = `${jwtHeader}.${jwtClaims}`;

  const privateKeyBuffer = urlBase64ToUint8Array(privateKey);
  const cryptoKey = await crypto.subtle.importKey(
    'pkcs8',
    privateKeyBuffer,
    { name: 'ECDSA', namedCurve: 'P-256' } as EcKeyImportParams,
    true,
    ['sign']
  );

  const signature = await crypto.subtle.sign(
    { name: 'ECDSA', hash: 'SHA-256' },
    cryptoKey,
    new TextEncoder().encode(unsignedToken)
  );

  const jwt = `${unsignedToken}.${uint8ArrayToBase64Url(new Uint8Array(signature))}`;

  return {
    Authorization: `WebPush ${jwt}`,
    'Crypto-Key': `p256ecdsa=${publicKey}`,
  };
}

// Function to encrypt the payload
async function encryptPayload(
  rawPayload: string,
  userPublicKey: string, // p256dh from subscription
  userAuth: string // auth from subscription
): Promise<{ encryptedPayload: Uint8Array; salt: Uint8Array; rs: Uint8Array; }> {
  const payload = new TextEncoder().encode(rawPayload);
  const P256DH_KEY_LEN = 65; // Length of P-256 public key
  const AUTH_SECRET_LEN = 16; // Length of authentication secret
  const AES_GCM_TAG_LEN = 16; // Length of AES-GCM authentication tag
  const AES_GCM_IV_LEN = 12; // Length of AES-GCM IV
  const AES_GCM_KEY_LEN = 16; // Length of AES-GCM key (128 bits)

  const salt = crypto.getRandomValues(new Uint8Array(16)); // 16 bytes for salt

  // Generate ephemeral ECDH key pair
  const ephemeralKeyPair = await crypto.subtle.generateKey(
    { name: 'ECDH', namedCurve: 'P-256' },
    true,
    ['deriveBits', 'deriveKey']
  );

  // Import user's public key
  const userPublicKeyBuffer = urlBase64ToUint8Array(userPublicKey);
  const importedUserPublicKey = await crypto.subtle.importKey(
    'raw',
    userPublicKeyBuffer,
    { name: 'ECDH', namedCurve: 'P-256' } as EcKeyImportParams,
    true,
    []
  );

  // Derive shared secret
  const sharedSecret = await crypto.subtle.deriveBits(
    { name: 'ECDH', public: importedUserPublicKey },
    ephemeralKeyPair.privateKey,
    256 // 256 bits for P-256 curve
  );

  // Extract ephemeral public key
  const ephemeralPublicKey = await crypto.subtle.exportKey('raw', ephemeralKeyPair.publicKey);

  // Derive Content Encryption Key (CEK) and Nonce (IV)
  const authSecret = urlBase64ToUint8Array(userAuth);

  // HKDF-Extract step (PRK)
  const prk = await crypto.subtle.importKey(
    'raw',
    sharedSecret,
    { name: 'HKDF' },
    false,
    ['deriveKey']
  );

  // HKDF-Expand step for CEK
  const cek = await crypto.subtle.deriveKey(
    { name: 'HKDF', hash: 'SHA-256', salt: salt, info: new TextEncoder().encode('Content-Encoding: aes128gcm\0') },
    prk,
    { name: 'AES-GCM', length: 128 },
    false,
    ['encrypt']
  );

  // HKDF-Expand step for Nonce (IV)
  const nonceBuffer = await crypto.subtle.deriveBits(
    { name: 'HKDF', hash: 'SHA-256', salt: salt, info: new TextEncoder().encode('Content-Encoding: nonce\0') },
    prk,
    96 // 96 bits for 12-byte IV
  );

  // Encrypt the payload
  const encryptedResult = await crypto.subtle.encrypt(
    { name: 'AES-GCM', iv: new Uint8Array(nonceBuffer) }, // Use the derived nonce as IV
    cek,
    payload
  );

  return {
    encryptedPayload: new Uint8Array(encryptedResult),
    salt: salt,
    rs: new Uint8Array(ephemeralPublicKey), // Ephemeral public key is 'rs' in web-push
  };
}

// Main function to send the push notification
async function sendPushNotification(
  subscription: PushSubscription, // Takes the full subscription object
  payload: string,
  vapidPrivateKey: string,
  vapidPublicKey: string,
  vapidMailto: string
): Promise<Response> {
  const vapidHeaders = await generateVapidHeaders(subscription.endpoint, vapidPrivateKey, vapidPublicKey, vapidMailto);

  const { encryptedPayload, salt, rs } = await encryptPayload(
    payload,
    subscription.keys.p256dh,
    subscription.keys.auth
  );

  const headers = new Headers({
    'Content-Type': 'application/octet-stream',
    'Content-Encoding': 'aes128gcm',
    'Encryption': `salt=${uint8ArrayToBase64Url(salt)};rs=${uint8ArrayToBase64Url(rs)}`,
    ...vapidHeaders,
  });

  return fetch(subscription.endpoint, {
    method: 'POST',
    headers: headers,
    body: encryptedPayload,
  });
}

// --- End Manual Web Push Implementation ---


// Inizializza Supabase client
const supabase = createClient(
  Deno.env.get('SUPABASE_URL') ?? '',
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
);

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: new Headers(corsHeaders) });
  }

  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method Not Allowed' }), {
      status: 405,
      headers: new Headers(corsHeaders),
    });
  }

  try {
    const now = new Date();

    // 1. Fetch promemoria dovuti e non inviati
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
      return new Response(JSON.stringify({ message: 'No reminders to send.' }), {
        headers: new Headers(corsHeaders),
      });
    }

    const notificationsToSend = reminders.map(async (reminder: ScheduledOrder) => {
      // 2. Fetch profilo utente separatamente
      const { data: profile, error: profileError } = await supabase
        .from('profiles')
        .select('push_subscription')
        .eq('id', reminder.user_id)
        .single();

      if (profileError || !profile || !profile.push_subscription) {
        console.error(`No push subscription for user ${reminder.user_id} for reminder ${reminder.id}`);
        return { status: 'no-subscription', reminderId: reminder.id };
      }

      const subscription = profile.push_subscription as PushSubscription;

      const payload = JSON.stringify({
        title: `Promemoria Ordine: ${reminder.suppliers.name}`,
        body: reminder.reminder_type === 'prefilled'
          ? 'Il tuo ordine precompilato è pronto per essere inviato.'
          : `È ora di fare l'ordine per ${reminder.suppliers.name}!`,
        data: { url: `/reminders/${reminder.id}` }
      });

      const notificationData = {
        user_id: reminder.user_id,
        title: `Promemoria Ordine: ${reminder.suppliers.name}`,
        message: `È ora di fare l'ordine per ${reminder.suppliers.name}!`,
        type: 'info',
        reminder_id: reminder.id
      };

      try {
        // Replace webpush.sendNotification with manual sendPushNotification
        await sendPushNotification(
          subscription,
          payload,
          Deno.env.get('VAPID_PRIVATE_KEY') ?? '',
          Deno.env.get('VAPID_PUBLIC_KEY') ?? '',
          Deno.env.get('VAPID_MAILTO') ?? ''
        );

        const { error: insertError } = await supabase.from('notifications').insert([notificationData]);
        if (insertError) {
          console.error(`Error inserting notification for reminder ${reminder.id}:`, insertError);
        }
        return { status: 'success', reminderId: reminder.id };
      } catch (error) {
        console.error(`Error sending push notification for reminder ${reminder.id}:`, error);
        return { status: 'failed-push', reminderId: reminder.id };
      }
    });

    const results = await Promise.all(notificationsToSend);

    const sentIds = results
      .filter(r => r.status === 'success')
      .map(r => r.reminderId);

    if (sentIds.length > 0) {
      const { error: updateError } = await supabase
        .from('scheduled_orders')
        .update({ is_sent: true })
        .in('id', sentIds);

      if (updateError) {
        console.error('Error updating sent status for reminders:', updateError);
      }
    }

    return new Response(JSON.stringify({ message: 'Reminders processed.', results }), {
      headers: new Headers(corsHeaders),
    });

  } catch (error) {
    console.error('Error processing reminders:', error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: new Headers(corsHeaders),
    });
  }
});
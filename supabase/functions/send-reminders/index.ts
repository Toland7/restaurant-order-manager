const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

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
    // Construct the Vercel API URL
    const vercelApiUrl = `https://restaurant-order-manager.vercel.app/api/send-reminders?x-vercel-set-bypass-cookie=true&x-vercel-protection-bypass=${Deno.env.get('VERCEL_BYPASS_TOKEN') ?? ''}`;

    // Construct headers for the Vercel API call
    const vercelHeaders = new Headers({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${Deno.env.get('CRON_SECRET') ?? ''}`, // Assuming CRON_SECRET is also needed by Vercel
    });

    // Make the POST request to the Vercel API
    const vercelResponse = await fetch(vercelApiUrl, {
      method: 'POST',
      headers: vercelHeaders,
      body: JSON.stringify({}), // Empty body as per original curl command
    });

    // Read the response from Vercel
    const vercelResponseBody = await vercelResponse.json();

    // Return the Vercel API's response
    return new Response(JSON.stringify(vercelResponseBody), {
      status: vercelResponse.status,
      headers: new Headers(corsHeaders),
    });

  } catch (error) {
    console.error('Error calling Vercel API:', error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: new Headers(corsHeaders),
    });
  }
});
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import { corsHeaders } from '../_shared/cors.ts'

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // Create a Supabase client with the Auth context of the logged-in user.
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
    )

    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
      return new Response(JSON.stringify({ error: 'User not authenticated' }), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 401,
      })
    }

    // Fetch all user-related data in parallel for efficiency
    const [ 
      profileRes,
      ordersRes,
      suppliersRes,
      scheduledOrdersRes,
      notificationsRes
    ] = await Promise.all([
      supabase.from('profiles').select('*').eq('id', user.id).single(),
      supabase.from('orders').select('*, order_items(*)').eq('user_id', user.id),
      supabase.from('suppliers').select('*, products(*)').eq('user_id', user.id),
      supabase.from('scheduled_orders').select('*').eq('user_id', user.id),
      supabase.from('notifications').select('*').eq('user_id', user.id)
    ]);

    // Check for errors in each query
    if (profileRes.error) throw profileRes.error;
    if (ordersRes.error) throw ordersRes.error;
    if (suppliersRes.error) throw suppliersRes.error;
    if (scheduledOrdersRes.error) throw scheduledOrdersRes.error;
    if (notificationsRes.error) throw notificationsRes.error;

    // Assemble the export data
    const userExport = {
      exported_at: new Date().toISOString(),
      user: {
        id: user.id,
        email: user.email,
        created_at: user.created_at,
        last_sign_in_at: user.last_sign_in_at,
      },
      profile: profileRes.data,
      orders: ordersRes.data,
      suppliers: suppliersRes.data,
      scheduled_orders: scheduledOrdersRes.data,
      notifications: notificationsRes.data
    }

    return new Response(JSON.stringify(userExport, null, 2), { // Pretty-print the JSON
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      status: 200,
    })
  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      status: 400,
    })
  }
})
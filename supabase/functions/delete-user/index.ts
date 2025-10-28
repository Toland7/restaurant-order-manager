import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import { corsHeaders } from '../_shared/cors.ts'

Deno.serve(async (req) => {
  // Handle preflight OPTIONS request for CORS
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

    // Get the user object from the JWT.
    const { data: { user: caller } } = await supabase.auth.getUser()

    if (!caller) {
      return new Response(JSON.stringify({ error: 'User not authenticated' }), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 401,
      })
    }

    // Parse the request body to get optional userId
    let userIdToDelete = caller.id; // Default to self
    try {
      const body = await req.json();
      if (body.userId) {
        userIdToDelete = body.userId;
      }
    } catch (e) {
      // No body or invalid, use self
    }

    // If trying to delete someone else, check if caller is admin
    if (userIdToDelete !== caller.id) {
      const supabaseAdmin = createClient(
        Deno.env.get('SUPABASE_URL') ?? '',
        Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
      );

      const { data: profile, error: profileError } = await supabaseAdmin
        .from('profiles')
        .select('is_admin')
        .eq('id', caller.id)
        .single();

      if (profileError || !profile || !profile.is_admin) {
        return new Response(JSON.stringify({ error: 'Permission denied: Only admins can delete other users.' }), {
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
          status: 403,
        });
      }
    }

    // Create a Supabase admin client to perform the user deletion.
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    )

    // Securely delete the user
    const { error: deleteError } = await supabaseAdmin.auth.admin.deleteUser(userIdToDelete)

    if (deleteError) {
      throw deleteError
    }

    return new Response(JSON.stringify({ message: 'User deleted successfully' }), {
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
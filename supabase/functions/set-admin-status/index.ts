
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
import { corsHeaders } from '../_shared/cors.ts';

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const { target_user_id, is_admin } = await req.json();
    if (target_user_id === undefined || is_admin === undefined) {
      throw new Error("target_user_id and is_admin status are required");
    }

    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
    );

    // 1. Verify the caller is an admin
    const authHeader = req.headers.get('Authorization');
    if (!authHeader) throw new Error("Missing authorization header");
    const jwt = authHeader.replace('Bearer ', '');
    const { data: { user: caller } } = await supabaseAdmin.auth.getUser(jwt);
    if (!caller) throw new Error("Invalid JWT");

    // Prevent admin from removing their own admin status
    if (caller.id === target_user_id && is_admin === false) {
      throw new Error("Admins cannot remove their own admin status.");
    }

    const { data: profile, error: profileError } = await supabaseAdmin
      .from('profiles')
      .select('is_admin')
      .eq('id', caller.id)
      .single();

    if (profileError || !profile || !profile.is_admin) {
      return new Response(JSON.stringify({ error: 'Permission denied: User is not an admin.' }), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 403,
      });
    }

    // 2. If caller is an admin, proceed with updating target user's admin status
    const { data: updatedProfile, error: updateProfileError } = await supabaseAdmin
      .from('profiles')
      .update({ is_admin: is_admin })
      .eq('id', target_user_id)
      .select()
      .single();

    if (updateProfileError) throw updateProfileError;

    return new Response(JSON.stringify({ message: `User admin status updated successfully.`, profile: updatedProfile }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      status: 200,
    });

  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      status: 400,
    });
  }
});

import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

// CORS headers
const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

// Use native Web Crypto API for password hashing (PBKDF2)
async function verifyPin(pin, storedHash) {
  const [salt_hex, hash_hex] = storedHash.split(':');
  if (!salt_hex || !hash_hex) return false;

  const salt = new Uint8Array(salt_hex.match(/.{1,2}/g).map(byte => parseInt(byte, 16)));
  const encoder = new TextEncoder();
  const keyMaterial = await crypto.subtle.importKey(
    'raw',
    encoder.encode(pin),
    { name: 'PBKDF2' },
    false,
    ['deriveBits', 'deriveKey']
  );
  const derivedBits = await crypto.subtle.deriveBits(
    { 
      name: 'PBKDF2',
      salt: salt,
      iterations: 100000,
      hash: 'SHA-256' 
    },
    keyMaterial,
    256
  );
  const derived_hash_hex = Array.from(new Uint8Array(derivedBits)).map(b => b.toString(16).padStart(2, '0')).join('');
  return derived_hash_hex === hash_hex;
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
    );

    const { data: { user } } = await supabaseClient.auth.getUser();
    if (!user) {
      return new Response(JSON.stringify({ error: 'Unauthorized' }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 401 });
    }

    const { profile_id, pin } = await req.json();
    if (!profile_id || !pin) {
      return new Response(JSON.stringify({ error: 'Missing profile_id or pin' }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 });
    }

    const { data: profile, error: profileError } = await supabaseClient.from('in_app_profiles').select('pin_hash, user_id').eq('id', profile_id).single();
    if (profileError || !profile || profile.user_id !== user.id) {
      return new Response(JSON.stringify({ error: 'Profile not found or does not belong to user' }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 403 });
    }

    if (!profile.pin_hash) {
      return new Response(JSON.stringify({ is_valid: false, error: 'PIN not set for this profile' }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 });
    }

    const is_valid = await verifyPin(pin, profile.pin_hash);

    return new Response(JSON.stringify({ is_valid }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 200 });

  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 500 });
  }
});

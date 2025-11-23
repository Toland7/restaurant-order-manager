// Copia questo codice nella console del browser (F12 > Console) per verificare lo stato del tuo profilo

// 1. Verifica l'utente corrente
console.log('=== VERIFICA UTENTE ===');
const user = JSON.parse(localStorage.getItem('supabase.auth.token'))?.currentSession?.user;
console.log('User ID:', user?.id);
console.log('User Email:', user?.email);

// 2. Importa supabase dalla tua app
import { supabase } from './src/supabase.js';

// 3. Verifica il profilo
const { data: profile, error: profileError } = await supabase
  .from('profiles')
  .select('*, companies(*)')
  .eq('id', user.id)
  .single();

console.log('\n=== PROFILO ===');
console.log('Profile:', profile);
console.log('Error:', profileError);

// 4. Verifica l'in_app_profile
const { data: inAppProfile, error: inAppError } = await supabase
  .from('in_app_profiles')
  .select('*')
  .eq('user_id', user.id);

console.log('\n=== IN_APP_PROFILE ===');
console.log('In-app profiles:', inAppProfile);
console.log('Error:', inAppError);

// 5. Verifica i permessi
if (inAppProfile && inAppProfile.length > 0) {
  const { data: permissions, error: permError } = await supabase
    .from('profile_permissions')
    .select('*, permissions(*)')
    .eq('profile_id', inAppProfile[0].id);

  console.log('\n=== PERMESSI ===');
  console.log('Permissions:', permissions);
  console.log('Error:', permError);
}

// 6. Verifica subscription status
console.log('\n=== SUBSCRIPTION STATUS ===');
console.log('Tier:', profile?.companies?.subscription_tier);
console.log('Trial Start:', profile?.companies?.trial_start_date);
console.log('Trial End:', profile?.companies?.trial_end_date);

// Calcola se il trial è scaduto
if (profile?.companies?.subscription_tier === 'demo') {
  const trialEnd = new Date(profile.companies.trial_end_date);
  const now = new Date();
  const isExpired = now > trialEnd;
  console.log('Trial scaduto?', isExpired);
  console.log('Giorni rimanenti:', Math.ceil((trialEnd - now) / (1000 * 60 * 60 * 24)));
}

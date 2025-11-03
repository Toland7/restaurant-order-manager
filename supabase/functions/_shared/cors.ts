export const corsHeaders = {
  'Access-Control-Allow-Origin': '*', // For development, * is fine. For production, you might want to restrict this to your app's domain.
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};
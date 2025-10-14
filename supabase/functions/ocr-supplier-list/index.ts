import { serve } from 'https://deno.land/std@0.177.0/http/server.ts';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.7.1';
import Tesseract from 'https://esm.sh/tesseract.js@5.0.0'; // Corrected import for Tesseract

console.log('Hello from Functions!');

serve(async (req) => {
  // Handle CORS preflight requests
  if (req.method === 'OPTIONS') {
    return new Response('ok', {
      headers: {
        'Access-Control-Allow-Origin': '*' , // Or specific origin
        'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
      },
    });
  }

  const supabaseClient = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_ANON_KEY') ?? '',
    {
      global: {
        headers: { Authorization: req.headers.get('Authorization')! },
      },
    }
  );

  try {
    const { imageUrl } = await req.json(); // Expecting an image URL or base64 string

    if (!imageUrl) {
      return new Response(JSON.stringify({ error: 'Image URL or base64 string is required' }), {
        headers: { 'Content-Type': 'application/json' },
        status: 400,
      });
    }

    // Initialize Tesseract worker
    const worker = await Tesseract.createWorker({
      logger: m => console.log(m) // Optional: log progress
    });

    await worker.loadLanguage('ita'); // Load Italian language
    await worker.initialize('ita');

    const { data: { text } } = await worker.recognize(imageUrl);

    await worker.terminate();

    // --- Parsing Logic ---
    const suppliers: { supplier_name: string; items: { name: string }[] }[] = [];
    let currentSupplier: { supplier_name: string; items: { name: string }[] } | null = null;

    const lines = text.split('\n').map(line => line.trim()).filter(line => line.length > 0);

    for (const line of lines) {
      if (line.startsWith('- ') && line.endsWith(' BC STREET')) {
        // New supplier block
        if (currentSupplier) {
          suppliers.push(currentSupplier);
        }
        const supplierName = line.substring(2).replace(' BC STREET', '').trim();
        currentSupplier = { supplier_name: supplierName, items: [] };
      } else if (currentSupplier) {
        // Item line - assuming a simple two-column structure or single item name
        const parts = line.split(/\s{2,}/); // Split by 2 or more spaces to handle potential columns
        const name = parts[0].trim();
        if (name) {
          currentSupplier.items.push({ name: name });
        }
      }
    }

    if (currentSupplier) {
      suppliers.push(currentSupplier);
    }
    // --- End Parsing Logic ---

    return new Response(JSON.stringify({ suppliers }), {
      headers: { 'Content-Type': 'application/json' },
      status: 200,
    });
  } catch (error) {
    console.error('Error:', error);
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { 'Content-Type': 'application/json' },
      status: 500,
    });
  }
});

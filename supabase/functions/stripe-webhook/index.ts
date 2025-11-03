import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import Stripe from 'https://esm.sh/stripe@12.0.0'

serve(async (req) => {
  const stripe = new Stripe(Deno.env.get('STRIPE_SECRET_KEY')!, {
    apiVersion: '2022-11-15',
  })
  const supabase = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!)

  const sig = req.headers.get('stripe-signature')
  const body = await req.text()
  let event

  try {
    event = stripe.webhooks.constructEvent(body, sig!, Deno.env.get('STRIPE_WEBHOOK_SECRET')!)
  } catch (err) {
    return new Response('Webhook signature verification failed.', { status: 400 })
  }

  if (event.type === 'customer.subscription.created' || event.type === 'customer.subscription.updated' || event.type === 'customer.subscription.deleted') {
    const subscription = event.data.object
    const customerId = subscription.customer
    const plan = subscription.items.data[0].price.lookup_key // Assume lookup_key is 'base', 'pro', 'enterprise'

    const { error } = await supabase
      .from('profiles')
      .update({ subscription_plan: plan, stripe_customer_id: customerId })
      .eq('stripe_customer_id', customerId)

    if (error) console.error(error)
  }

  return new Response('ok', { status: 200 })
})
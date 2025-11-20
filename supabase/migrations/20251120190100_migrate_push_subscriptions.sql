INSERT INTO public.push_subscriptions (user_id, subscription)
SELECT id, push_subscription
FROM public.profiles
WHERE push_subscription IS NOT NULL;

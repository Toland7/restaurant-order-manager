CREATE TABLE public.push_subscriptions (
    id bigserial PRIMARY KEY,
    user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    subscription jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

ALTER TABLE public.push_subscriptions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can manage their own push subscriptions"
ON "public"."push_subscriptions"
AS PERMISSIVE
FOR ALL
TO public
USING ((auth.uid() = user_id))
WITH CHECK ((auth.uid() = user_id));

-- Add a unique constraint to avoid duplicate subscriptions
ALTER TABLE public.push_subscriptions
ADD CONSTRAINT unique_subscription UNIQUE (user_id, subscription);


-- Add company_id to public.orders
ALTER TABLE public.orders ADD COLUMN company_id UUID;

-- Populate company_id for existing orders
UPDATE public.orders o
SET company_id = p.company_id
FROM public.profiles p
WHERE o.user_id = p.id;

-- Set company_id as NOT NULL and add foreign key constraint
ALTER TABLE public.orders ALTER COLUMN company_id SET NOT NULL;
ALTER TABLE public.orders ADD CONSTRAINT fk_orders_company FOREIGN KEY (company_id) REFERENCES public.companies(id);

-- Add company_id to public.suppliers
ALTER TABLE public.suppliers ADD COLUMN company_id UUID;

-- Populate company_id for existing suppliers
UPDATE public.suppliers s
SET company_id = p.company_id
FROM public.profiles p
WHERE s.user_id = p.id;

-- Set company_id as NOT NULL and add foreign key constraint
ALTER TABLE public.suppliers ALTER COLUMN company_id SET NOT NULL;
ALTER TABLE public.suppliers ADD CONSTRAINT fk_suppliers_company FOREIGN KEY (company_id) REFERENCES public.companies(id);

-- Add company_id to public.scheduled_orders
ALTER TABLE public.scheduled_orders ADD COLUMN company_id UUID;

-- Populate company_id for existing scheduled_orders
UPDATE public.scheduled_orders so
SET company_id = p.company_id
FROM public.profiles p
WHERE so.user_id = p.id;

-- Set company_id as NOT NULL and add foreign key constraint
ALTER TABLE public.scheduled_orders ALTER COLUMN company_id SET NOT NULL;
ALTER TABLE public.scheduled_orders ADD CONSTRAINT fk_scheduled_orders_company FOREIGN KEY (company_id) REFERENCES public.companies(id);

-- Add company_id to public.notifications
ALTER TABLE public.notifications ADD COLUMN company_id UUID;

-- Populate company_id for existing notifications
UPDATE public.notifications n
SET company_id = p.company_id
FROM public.profiles p
WHERE n.user_id = p.id;

-- Set company_id as NOT NULL and add foreign key constraint
ALTER TABLE public.notifications ALTER COLUMN company_id SET NOT NULL;
ALTER TABLE public.notifications ADD CONSTRAINT fk_notifications_company FOREIGN KEY (company_id) REFERENCES public.companies(id);

-- Add company_id to public.order_items
ALTER TABLE public.order_items ADD COLUMN company_id UUID;

-- Populate company_id for existing order_items
UPDATE public.order_items oi
SET company_id = o.company_id
FROM public.orders o
WHERE oi.order_id = o.id;

-- Set company_id as NOT NULL and add foreign key constraint
ALTER TABLE public.order_items ALTER COLUMN company_id SET NOT NULL;
ALTER TABLE public.order_items ADD CONSTRAINT fk_order_items_company FOREIGN KEY (company_id) REFERENCES public.companies(id);

-- Add company_id to public.products
ALTER TABLE public.products ADD COLUMN company_id UUID;

-- Populate company_id for existing products
UPDATE public.products prod
SET company_id = s.company_id
FROM public.suppliers s
WHERE prod.supplier_id = s.id;

-- Set company_id as NOT NULL and add foreign key constraint
ALTER TABLE public.products ALTER COLUMN company_id SET NOT NULL;
ALTER TABLE public.products ADD CONSTRAINT fk_products_company FOREIGN KEY (company_id) REFERENCES public.companies(id);

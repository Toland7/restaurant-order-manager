-- First, drop the existing constraint
ALTER TABLE suppliers
DROP CONSTRAINT suppliers_contact_method_check;

-- Then, add the new constraint with the added value
ALTER TABLE suppliers
ADD CONSTRAINT suppliers_contact_method_check
CHECK (contact_method IN ('whatsapp', 'email', 'sms', 'whatsapp_group'));

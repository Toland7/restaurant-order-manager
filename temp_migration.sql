-- Prima rimuove il vincolo esistente
ALTER TABLE suppliers
DROP CONSTRAINT suppliers_contact_method_check;

-- Poi aggiunge il nuovo vincolo con l'opzione in più
ALTER TABLE suppliers
ADD CONSTRAINT suppliers_contact_method_check
CHECK (contact_method IN ('whatsapp', 'email', 'sms', 'whatsapp_group'));
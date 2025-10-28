import React, { useState } from 'react';
import { Plus, Edit3, Trash2, Check, Users } from 'lucide-react';
import { supabaseHelpers } from '../supabase';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { useNavigate } from 'react-router-dom';

const SuppliersPage = ({ suppliers, setSuppliers, user }) => {
    const navigate = useNavigate();
    const [isAdding, setIsAdding] = useState(false);
    const [editingSupplier, setEditingSupplier] = useState(null);
    const [newSupplier, setNewSupplier] = useState({ name: '', contact_method: 'whatsapp', contact: '', products: [], message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:', email_subject: '' });
    const [newProduct, setNewProduct] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);

    const addProduct = () => { if (newProduct.trim()) { setNewSupplier(prev => ({ ...prev, products: [...prev.products, newProduct.trim()] })); setNewProduct(''); } };
    const removeProduct = (index) => { setNewSupplier(prev => ({ ...prev, products: prev.products.filter((_, i) => i !== index) })); };

    const saveSupplier = async () => {
      if (!newSupplier.name || !newSupplier.contact) { toast.error('Nome e contatto sono obbligatori'); return; }
      if (!user) { toast.error('Sessione utente non valida. Effettua nuovamente il login.'); navigate('/auth'); return; }
      setIsSubmitting(true);
      try {
        const supplierData = { user_id: user.id, name: newSupplier.name, contact_method: newSupplier.contact_method, contact: newSupplier.contact, message_template: newSupplier.message_template, email_subject: newSupplier.email_subject };
        let savedSupplier;
        if (editingSupplier) {
          savedSupplier = await supabaseHelpers.updateSupplier(editingSupplier.id, supplierData);
          await supabaseHelpers.deleteProductsBySupplier(editingSupplier.id);
          if (newSupplier.products.length > 0) await supabaseHelpers.createProducts(editingSupplier.id, newSupplier.products);
          setSuppliers(prev => prev.map(s => s.id === editingSupplier.id ? { ...savedSupplier, products: newSupplier.products } : s));
          toast.success('Fornitore aggiornato con successo');
        } else {
          savedSupplier = await supabaseHelpers.createSupplier(supplierData);
          if (newSupplier.products.length > 0) await supabaseHelpers.createProducts(savedSupplier.id, newSupplier.products);
          setSuppliers(prev => [...prev, { ...savedSupplier, products: newSupplier.products }]);
          toast.success('Fornitore aggiunto con successo');
        }
        setNewSupplier({ name: '', contact_method: 'whatsapp', contact: '', products: [], message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:' });
        setIsAdding(false);
        setEditingSupplier(null);
        if (!editingSupplier) { setTimeout(() => { if (window.confirm('Fornitore aggiunto! Vuoi aggiungerne un altro?')) setIsAdding(true); }, 1000); }
      } catch (error) {
        console.error('Error saving supplier:', error);
        toast.error('Errore durante il salvataggio');
        if (error.message && error.message.includes('Auth session missing')) navigate('/auth');
      } finally {
        setIsSubmitting(false);
      }
    };

    const editSupplier = (supplier) => {
      setNewSupplier({ name: supplier.name, contact_method: supplier.contact_method, contact: supplier.contact, products: supplier.products || [], message_template: supplier.message_template, email_subject: supplier.email_subject || '' });
      setEditingSupplier(supplier);
      setIsAdding(true);
    };

    const deleteSupplier = async (id) => {
      if (!window.confirm('Sei sicuro di voler eliminare questo fornitore? Questa azione eliminerà anche tutti i prodotti associati.')) return;
      try {
        await supabaseHelpers.deleteSupplier(id);
        setSuppliers(prev => prev.filter(s => s.id !== id));
        toast.success('Fornitore eliminato');
      } catch (error) {
        console.error('Error deleting supplier:', error);
        toast.error("Errore durante l'eliminazione");
      }
    };

    return (
      <div className="min-h-screen app-background">
        <Header title="Gestione Fornitori" onBack={() => navigate('/')} />
        <div className="max-w-sm mx-auto px-6 py-6">
          {!isAdding ? (
            <>
              <button onClick={() => setIsAdding(true)} className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium mb-6 flex items-center justify-center space-x-2 hover:bg-blue-600 transition-colors"><Plus size={20} /><span>Aggiungi Fornitore</span></button>
              <div className="space-y-4">
                {suppliers.map(supplier => (
                  <div key={supplier.id} className="glass-card p-4">
                    <div className="flex justify-between items-start mb-2">
                      <h3 className="font-medium text-gray-900">{supplier.name}</h3>
                      <div className="flex space-x-2">
                        <button onClick={() => editSupplier(supplier)} className="p-1 text-blue-500 hover:bg-blue-50 rounded"><Edit3 size={16} /></button>
                        <button onClick={() => deleteSupplier(supplier.id)} className="p-1 text-red-500 hover:bg-red-50 rounded"><Trash2 size={16} /></button>
                      </div>
                    </div>
                    <p className="text-sm text-gray-600 mb-1"><span className="font-medium">Contatto:</span> {supplier.contact_method} - {supplier.contact}</p>
                    <p className="text-sm text-gray-600"><span className="font-medium">Prodotti:</span> {supplier.products ? supplier.products.join(', ') : 'Nessun prodotto'}</p>
                  </div>
                ))}
                {suppliers.length === 0 && <div className="text-center py-12"><Users size={48} className="mx-auto text-gray-300 mb-4" /><p className="text-gray-500 mb-4">Nessun fornitore ancora aggiunto</p><button onClick={() => setIsAdding(true)} className="text-blue-500 hover:text-blue-600 font-medium">Aggiungi il primo fornitore</button></div>}
              </div>
            </>
          ) : (
            <div className="space-y-6">
              <div className="glass-card p-4"><label htmlFor="supplier-name" className="block text-sm font-medium text-gray-700 mb-2">Nome Fornitore *</label><input id="supplier-name" name="supplier-name" type="text" value={newSupplier.name} onChange={(e) => setNewSupplier(prev => ({ ...prev, name: e.target.value }))} className="input" placeholder="Es. Fornitore Verdure Bio" /></div>
              <div className="glass-card p-4"><label htmlFor="contact-method" className="block text-sm font-medium text-gray-700 mb-2">Metodo di Invio</label><select id="contact-method" name="contact-method" value={newSupplier.contact_method} onChange={(e) => setNewSupplier(prev => ({ ...prev, contact_method: e.target.value }))} className="select"><option value="whatsapp">WhatsApp</option><option value="whatsapp_group">Gruppo WhatsApp</option><option value="email">Email</option><option value="sms">Messaggio</option></select></div>
              <div className="glass-card p-4"><label htmlFor="contact" className="block text-sm font-medium text-gray-700 mb-2">Contatto *</label><input id="contact" name="contact" type="text" value={newSupplier.contact} onChange={(e) => setNewSupplier(prev => ({ ...prev, contact: e.target.value }))} className="input" placeholder={newSupplier.contact_method === 'whatsapp' || newSupplier.contact_method === 'sms' || newSupplier.contact_method === 'whatsapp_group' ? "+39 123 456 7890" : "email@fornitore.com"} /></div>
              {newSupplier.contact_method === 'email' && <div className="glass-card p-4"><label htmlFor="email-subject" className="block text-sm font-medium text-gray-700 mb-2">Oggetto Email</label><input id="email-subject" name="email-subject" type="text" value={newSupplier.email_subject} onChange={(e) => setNewSupplier(prev => ({ ...prev, email_subject: e.target.value }))} className="input" placeholder="Oggetto dell'email" /></div>}
              <div className="glass-card p-4">
                <span className="block text-sm font-medium text-gray-700 mb-2">Prodotti</span>
                <label htmlFor="new-product" className="block text-sm font-medium text-gray-700 mb-2">Nuovo Prodotto</label>
                <div className="flex space-x-2 mb-3"><input id="new-product" name="new-product" type="text" value={newProduct} onChange={(e) => setNewProduct(e.target.value)} className="flex-1 p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Aggiungi prodotto..." onKeyPress={(e) => e.key === 'Enter' && addProduct()} /><button onClick={addProduct} className="btn btn-primary"><Plus size={16} /></button></div>
                <div className="space-y-2">{newSupplier.products.map((product, index) => <div key={index} className="flex items-center justify-between p-2 bg-gray-50 rounded-lg"><span className="text-sm text-gray-700">{product}</span><button onClick={() => removeProduct(index)} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button></div>)}</div>
              </div>
              <div className="glass-card p-4"><label htmlFor="message-template" className="block text-sm font-medium text-gray-700 mb-2">Messaggio Predefinito</label><textarea id="message-template" name="message-template" value={newSupplier.message_template} onChange={(e) => setNewSupplier(prev => ({ ...prev, message_template: e.target.value }))} className="input" rows="3" placeholder="Messaggio che precederà ogni ordine..." /></div>
              <div className="flex space-x-3"><button onClick={() => { setIsAdding(false); setEditingSupplier(null); setNewSupplier({ name: '', contact_method: 'whatsapp', contact: '', products: [], message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:' }); }} className="btn btn-outline flex-1" disabled={isSubmitting}>Annulla</button><button onClick={saveSupplier} disabled={isSubmitting} className="btn btn-primary flex-1">{isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <Check size={16} />}<span>{isSubmitting ? 'Salvando...' : 'Salva'}</span></button></div>
            </div>
          )}
        </div>
      </div>
    );
}

export default SuppliersPage;
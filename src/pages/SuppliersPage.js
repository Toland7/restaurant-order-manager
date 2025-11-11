import React, { useState } from 'react';
import { Plus, Edit3, Trash2, Check, Users, Download, Lock } from 'lucide-react';
import { supabaseHelpers } from '../supabase';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from '../@/components/ui/dialog';
import { useNavigate } from 'react-router-dom';
import Papa from 'papaparse';
import ProductImportModal from '../components/modals/ProductImportModal';
import useSubscriptionStatus from '../hooks/useSubscriptionStatus'; // Import the hook

const SuppliersPage = ({ suppliers, setSuppliers, user }) => {
    const navigate = useNavigate();
    const { isProUser, loadingSubscription } = useSubscriptionStatus(); // Use the hook

    const [isAdding, setIsAdding] = useState(false);
    const [editingSupplier, setEditingSupplier] = useState(null);
    const [newSupplier, setNewSupplier] = useState({ name: '', contact_method: 'whatsapp', contact: '', products: [], message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:', email_subject: '', preferred_email_client: 'default' });
    const [newProduct, setNewProduct] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [isProductImportModalOpen, setIsProductImportModalOpen] = useState(false);

    const isLimitReached = !isProUser && suppliers.length >= 10;

    const resetNewSupplier = () => {
      setNewSupplier({ name: '', contact_method: 'whatsapp', contact: '', products: [], message_template: 'Buongiorno, vorremmo ordinare i seguenti prodotti:', email_subject: '', preferred_email_client: 'default' });
    };

    const handleAddSupplierClick = () => {
      if (isLimitReached) {
        toast.error('Hai raggiunto il limite di 10 fornitori per il piano Base. Esegui l\'upgrade a PRO per aggiungerne altri.');
      } else {
        setIsAdding(true);
      }
    };

    const handleImportClick = () => {
      if (isProUser) {
        setIsProductImportModalOpen(true);
      } else {
        toast.error('L\'importazione di prodotti da CSV è una funzionalità PRO. Esegui l\'upgrade per usarla.');
      }
    };

    const handleFileSelectedForImport = (file) => {
        if (!file) return;

        Papa.parse(file, {
            header: true,
            skipEmptyLines: true,
            complete: (results) => {
                const importedProducts = results.data
                    .map(row => row.product_name ? String(row.product_name).trim() : null)
                    .filter(Boolean);

                if (importedProducts.length > 0) {
                    setNewSupplier(prev => ({ ...prev, products: [...prev.products, ...importedProducts] }));
                    toast.success(`${importedProducts.length} prodotti importati con successo!`);
                } else {
                    toast.error('Nessun prodotto valido trovato nel file CSV.');
                }
                setIsProductImportModalOpen(false); // Close modal on complete
            },
            error: (err) => {
                toast.error('Errore nella lettura del file CSV.');
                console.error('PapaParse error:', err);
                setIsProductImportModalOpen(false); // Close modal on error
            }
        });
    };


    const handleDownloadTemplate = () => {
        const headers = "product_name";
        const blob = new Blob([headers], { type: 'text/csv;charset=utf-8;' });
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.setAttribute('download', 'template_prodotti.csv');
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    };

    const addProduct = () => { if (newProduct.trim()) { setNewSupplier(prev => ({ ...prev, products: [...prev.products, newProduct.trim()] })); setNewProduct(''); } };
    const removeProduct = (index) => { setNewSupplier(prev => ({ ...prev, products: prev.products.filter((_, i) => i !== index) })); };

    const handleExportSupplierCSV = async (supplierId, supplierName) => {
      try {
        const products = await supabaseHelpers.getProductsBySupplier(supplierId);

        if (products.length === 0) {
          toast.success(`Nessun prodotto da esportare per ${supplierName}.`);
          return;
        }

        const headers = "product_name";
        const csvRows = [headers];

        products.forEach(product => {
          csvRows.push(`"${product.name}"`);
        });

        const csvString = csvRows.join('\n');
        const blob = new Blob([csvString], { type: 'text/csv;charset=utf-8;' });
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.setAttribute('download', `${supplierName.replace(/[^a-z0-9]/gi, '_').toLowerCase()}_products.csv`);
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        toast.success(`Prodotti di ${supplierName} esportati con successo!`);
      } catch (error) {
        console.error('Error exporting supplier products:', error);
        toast.error(`Errore durante l'esportazione dei prodotti.`);
      }
    };

    const saveSupplier = async () => {
      if (!newSupplier.name || !newSupplier.contact) { toast.error('Nome e contatto sono obbligatori'); return; }
      if (!user) { toast.error('Sessione utente non valida. Effettua nuovamente il login.'); navigate('/auth'); return; }
      setIsSubmitting(true);
      try {
        const supplierData = { user_id: user.id, name: newSupplier.name, contact_method: newSupplier.contact_method, contact: newSupplier.contact, message_template: newSupplier.message_template, email_subject: newSupplier.email_subject, preferred_email_client: newSupplier.preferred_email_client };
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
        resetNewSupplier();
        setIsAdding(false);
        setEditingSupplier(null);
        if (!editingSupplier) { setTimeout(() => { if (window.confirm('Fornitore aggiunto! Vuoi aggiungerne un altro?')) handleAddSupplierClick(); }, 1000); }
      } catch (error) {
        console.error('Error saving supplier:', error);
        toast.error('Errore durante il salvataggio');
        if (error.message && error.message.includes('Auth session missing')) navigate('/auth');
      } finally {
        setIsSubmitting(false);
      }
    };

    const editSupplier = (supplier) => {
      setNewSupplier({ name: supplier.name, contact_method: supplier.contact_method, contact: supplier.contact, products: supplier.products || [], message_template: supplier.message_template, email_subject: supplier.email_subject || '', preferred_email_client: supplier.preferred_email_client || 'default' });
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
              <button 
                onClick={handleAddSupplierClick} 
                disabled={isLimitReached || loadingSubscription}
                className="w-full bg-blue-500 text-white py-3 rounded-lg font-medium mb-2 flex items-center justify-center space-x-2 hover:bg-blue-600 transition-colors disabled:bg-gray-400 disabled:cursor-not-allowed"
              >
                <Plus size={20} />
                <span>Aggiungi Fornitore</span>
              </button>
              {isLimitReached && (
                <div className="text-center text-xs text-red-600 dark:text-red-400 mb-4 p-2 bg-red-100 dark:bg-red-900/20 rounded-md">
                  Limite di 10 fornitori raggiunto. <button className="font-bold underline" onClick={() => { /* TODO: Upgrade logic */ }}>Upgrade a PRO</button>
                </div>
              )}
              <div className="space-y-4 mt-4">
                {suppliers.map(supplier => (
                  <div key={supplier.id} className="glass-card p-4">
                    <div className="flex justify-between items-start mb-2">
                      <h3 className="font-medium text-gray-900">{supplier.name}</h3>
                      <div className="flex space-x-2">
                        <button onClick={() => handleExportSupplierCSV(supplier.id, supplier.name)} className="p-1 text-green-500 hover:bg-green-50 rounded"><Download size={16} /></button>
                        <button onClick={() => editSupplier(supplier)} className="p-1 text-blue-500 hover:bg-blue-50 rounded"><Edit3 size={16} /></button>
                        <button onClick={() => deleteSupplier(supplier.id)} className="p-1 text-red-500 hover:bg-red-50 rounded"><Trash2 size={16} /></button>
                      </div>
                    </div>
                    <p className="text-sm text-gray-600 mb-1"><span className="font-medium">Contatto:</span> {supplier.contact_method} - {supplier.contact}</p>
                    {supplier.contact_method === 'email' && supplier.email_subject && <p className="text-sm text-gray-600 mb-1"><span className="font-medium">Oggetto Email:</span> {supplier.email_subject}</p>}
                    {supplier.contact_method === 'email' && supplier.preferred_email_client && <p className="text-sm text-gray-600 mb-1"><span className="font-medium">Client Email:</span> {supplier.preferred_email_client}</p>}
                    <p className="text-sm text-gray-600"><span className="font-medium">Prodotti:</span> {supplier.products ? supplier.products.join(', ') : 'Nessun prodotto'}</p>
                  </div>
                ))}
                {suppliers.length === 0 && !loadingSubscription && <div className="text-center py-12"><Users size={48} className="mx-auto text-gray-300 mb-4" /><p className="text-gray-500 mb-4">Nessun fornitore ancora aggiunto</p><button onClick={handleAddSupplierClick} className="text-blue-500 hover:text-blue-600 font-medium">Aggiungi il primo fornitore</button></div>}
              </div>
            </>
          ) : (
            <div className="space-y-6">
              <div className="glass-card p-4"><label htmlFor="supplier-name" className="block text-sm font-medium text-gray-700 mb-2">Nome Fornitore *</label><input id="supplier-name" name="supplier-name" type="text" value={newSupplier.name} onChange={(e) => setNewSupplier(prev => ({ ...prev, name: e.target.value }))} className="input" placeholder="Es. Fornitore Verdure Bio" /></div>
              <div className="glass-card p-4"><label htmlFor="contact-method" className="block text-sm font-medium text-gray-700 mb-2">Metodo di Invio</label><select id="contact-method" name="contact-method" value={newSupplier.contact_method} onChange={(e) => setNewSupplier(prev => ({ ...prev, contact_method: e.target.value }))} className="select"><option value="whatsapp">WhatsApp</option><option value="whatsapp_group">Gruppo WhatsApp</option><option value="email">Email</option><option value="sms">Messaggio</option></select></div>
              <div className="glass-card p-4"><label htmlFor="contact" className="block text-sm font-medium text-gray-700 mb-2">Contatto *</label><input id="contact" name="contact" type="text" value={newSupplier.contact} onChange={(e) => setNewSupplier(prev => ({ ...prev, contact: e.target.value }))} className="input" placeholder={newSupplier.contact_method === 'whatsapp' || newSupplier.contact_method === 'sms' || newSupplier.contact_method === 'whatsapp_group' ? "+39 123 456 7890" : "email@fornitore.com"} /></div>
              {newSupplier.contact_method === 'email' && (
                <>
                  <div className="glass-card p-4">
                    <label htmlFor="email-subject" className="block text-sm font-medium text-gray-700 mb-2">Oggetto Email</label>
                    <input id="email-subject" name="email-subject" type="text" value={newSupplier.email_subject} onChange={(e) => setNewSupplier(prev => ({ ...prev, email_subject: e.target.value }))} className="input" placeholder="Oggetto dell'email" />
                  </div>
                  <div className="glass-card p-4">
                    <label htmlFor="preferred-email-client" className="block text-sm font-medium text-gray-700 mb-2">Client Email Preferito</label>
                    <select
                      id="preferred-email-client"
                      name="preferred-email-client"
                      value={newSupplier.preferred_email_client}
                      onChange={(e) => setNewSupplier(prev => ({ ...prev, preferred_email_client: e.target.value }))}
                      className="select"
                    >
                      <option value="default">Client predefinito</option>
                      <option value="gmail">Gmail</option>
                      <option value="outlook">Outlook</option>
                    </select>
                  </div>
                </>
              )}
              <div className="glass-card p-4">
                <div className="flex justify-between items-center mb-4">
                  <span className="block text-sm font-medium text-gray-700">Prodotti</span>
                  <button 
                    type="button" 
                    onClick={handleImportClick} 
                    disabled={!isProUser || loadingSubscription}
                    className="btn btn-outline text-sm py-1 px-2 flex items-center space-x-1 disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    {!isProUser && <Lock size={12} />}
                    <span>Importa da CSV</span>
                  </button>
                </div>

                <label htmlFor="new-product" className="block text-sm font-medium text-gray-700 mb-2">Nuovo Prodotto</label>
                <div className="flex space-x-2 mb-3"><input id="new-product" name="new-product" type="text" value={newProduct} onChange={(e) => setNewProduct(e.target.value)} className="flex-1 p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Aggiungi prodotto..." onKeyPress={(e) => e.key === 'Enter' && addProduct()} /><button onClick={addProduct} className="btn btn-primary"><Plus size={16} /></button></div>
                <div className="space-y-2">{newSupplier.products.map((product, index) => <div key={index} className="flex items-center justify-between p-2 bg-gray-50 rounded-lg"><span className="text-sm text-gray-700">{product}</span><button onClick={() => removeProduct(index)} className="p-1 text-red-500 hover:bg-red-100 rounded"><Trash2 size={14} /></button></div>)}</div>
              </div>
              <div className="glass-card p-4"><label htmlFor="message-template" className="block text-sm font-medium text-gray-700 mb-2">Messaggio Predefinito</label><textarea id="message-template" name="message-template" value={newSupplier.message_template} onChange={(e) => setNewSupplier(prev => ({ ...prev, message_template: e.target.value }))} className="input" rows="3" placeholder="Messaggio che precederà ogni ordine..." /></div>
              <div className="flex space-x-3"><button onClick={() => { setIsAdding(false); setEditingSupplier(null); resetNewSupplier(); }} className="btn btn-outline flex-1" disabled={isSubmitting}>Annulla</button><button onClick={saveSupplier} disabled={isSubmitting} className="btn btn-primary flex-1">{isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <Check size={16} />}<span>{isSubmitting ? 'Salvando...' : 'Salva'}</span></button></div>
            </div>
          )}

          <Dialog open={isProductImportModalOpen} onOpenChange={setIsProductImportModalOpen}>
            <DialogContent>
              <DialogHeader>
                <DialogTitle>Importa Prodotti da CSV</DialogTitle>
                <DialogDescription>
                  Carica un file CSV con una singola colonna "product_name" per aggiungere rapidamente più prodotti a questo fornitore.
                </DialogDescription>
              </DialogHeader>
              <ProductImportModal 
                onDownloadTemplate={handleDownloadTemplate}
                onFileSelect={handleFileSelectedForImport}
              />
            </DialogContent>
          </Dialog>

        </div>
      </div>
    );
}

export default SuppliersPage;
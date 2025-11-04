import React from 'react';
import { ChevronLeft } from 'lucide-react';
import { toast } from 'react-hot-toast';
import { supabaseHelpers } from '../../supabase';

import { useNavigate } from 'react-router-dom';

const openLinkInNewTab = (url) => {
    const newWindow = window.open(url, '_blank', 'noopener,noreferrer');
    if (newWindow) newWindow.opener = null;
};

const WizardModal = ({ showWizard, wizardOrders, wizardStep, setWizardStep, user, setNewlyCreatedOrders, setOrders, newlyCreatedOrders, setShowWizard, setWizardOrders, onOrderSent, setMultiOrders }) => {
    const navigate = useNavigate();
    if (!showWizard || wizardOrders.length === 0) return null;

    const handleSendOrder = async () => {
        const order = wizardOrders[wizardStep];

        try {
            const orderData = { user_id: user.id, supplier_id: order.supplier.id, order_message: order.message, additional_items: order.additional || null, status: 'sent' };
            const orderItemsToInsert = Object.entries(order.items).filter(([_, quantity]) => quantity && quantity !== '0').map(([productName, quantity]) => ({ product_name: productName, quantity: parseInt(quantity, 10) || 0 }));
            const newOrder = await supabaseHelpers.createOrder(orderData, orderItemsToInsert);
            setNewlyCreatedOrders(prev => [...prev, { ...newOrder, suppliers: order.supplier, order_items: orderItemsToInsert }]);
        } catch (error) {
            console.error('Error saving order from wizard:', error);
            toast.error('Errore durante il salvataggio dell\'ordine.');
        }

        const encodedMessage = encodeURIComponent(order.message);
        let contactLink = '';
        switch (order.supplier.contact_method) {
            case 'whatsapp': {
                const sanitizedContact = order.supplier.contact.replace(/\D/g, '');
                contactLink = `https://wa.me/${sanitizedContact}?text=${encodedMessage}`;
                break;
            }
            case 'whatsapp_group': {
                contactLink = `whatsapp://send?text=${encodedMessage}`;
                break;
            }
            case 'email': {
                contactLink = `mailto:${order.supplier.contact}?subject=${encodeURIComponent(order.email_subject || `Ordine Fornitore - ${order.supplier.name}`)}&body=${encodedMessage}`;
                break;
            }
            case 'sms': {
                const sanitizedContact = order.supplier.contact.replace(/\D/g, '');
                contactLink = `sms:${sanitizedContact}?body=${encodedMessage}`;
                break;
            }
            default:
                break;
        }
        openLinkInNewTab(contactLink);

        if (wizardStep < wizardOrders.length - 1) {
            setWizardStep(wizardStep + 1);
        } else {
            sessionStorage.removeItem('wizardState');
            setOrders(prev => [...newlyCreatedOrders, ...prev]);
            setNewlyCreatedOrders([]);
            setShowWizard(false);
            setWizardOrders([]);
            setWizardStep(0);
            toast.success('Tutti gli ordini inviati!');
            setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '' }]);
            if (onOrderSent) onOrderSent();
            else navigate('/');
        }
    };

    const handleExit = () => {
        sessionStorage.removeItem('wizardState');
        setShowWizard(false);
        setWizardOrders([]);
        setWizardStep(0);
        setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '' }]);
        if (onOrderSent) onOrderSent();
        else navigate('/');
    };

    return (
        <div className="modal-overlay">
            <div className="glass-card p-6 max-w-sm w-full max-h-96 overflow-y-auto">
                <h3 className="font-medium text-dark-gray dark:text-gray-100 mb-4">Invio Ordine {wizardStep + 1} di {wizardOrders.length}</h3>
                <div className="bg-light-gray p-3 rounded-lg mb-4">
                    <h4 className="font-medium text-dark-gray mb-2">{wizardOrders[wizardStep].supplier?.name || 'Fornitore sconosciuto'}</h4>
                    <pre className="text-sm text-dark-gray whitespace-pre-wrap">{wizardOrders[wizardStep].message}</pre>
                </div>
                <div className="flex items-center justify-between space-x-3">
                    <button onClick={() => setWizardStep(prev => Math.max(0, prev - 1))} disabled={wizardStep === 0} className="p-2 border border-medium-gray text-dark-gray rounded-lg hover:bg-light-gray"><ChevronLeft size={20} /></button>
                    <button onClick={handleSendOrder} className="flex-1 py-2 px-4 bg-primary-blue text-white rounded-lg hover:bg-secondary-blue">Invia</button>
                </div>
                <p onClick={handleExit} className="text-sm text-dark-gray mt-4 text-center cursor-pointer hover:underline">Esci</p>
            </div>
        </div>
    );
};

export default WizardModal;

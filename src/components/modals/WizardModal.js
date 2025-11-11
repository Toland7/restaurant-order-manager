import React from 'react';
import { ChevronLeft, Send } from 'lucide-react';
import { toast } from 'react-hot-toast';
import { supabaseHelpers } from '../../supabase';

import { useNavigate } from 'react-router-dom';

const openLinkInNewTab = (url) => {
    const newWindow = window.open(url, '_blank', 'noopener,noreferrer');
    if (newWindow) newWindow.opener = null;
};

const generateEmailLink = (to, subject, body, preferredClient) => {
    const encodedSubject = encodeURIComponent(subject);
    const encodedBody = encodeURIComponent(body);

    switch (preferredClient) {
        case 'gmail':
            return `https://mail.google.com/mail/?view=cm&fs=1&to=${to}&su=${encodedSubject}&body=${encodedBody}`;
        case 'outlook':
            return `https://outlook.live.com/owa/?path=/mail/action/compose&to=${to}&subject=${encodedSubject}&body=${encodedBody}`;
        case 'default':
        default:
            return `mailto:${to}?subject=${encodedSubject}&body=${encodedBody}`;
    }
};

const WizardModal = ({ showWizard, wizardOrders, wizardStep, setWizardStep, user, setNewlyCreatedOrders, setOrders, newlyCreatedOrders, setShowWizard, setWizardOrders, onOrderSent, setMultiOrders, onBackToEdit }) => {
    const [isSubmitting, setIsSubmitting] = React.useState(false);
    const navigate = useNavigate();
    if (!showWizard || wizardOrders.length === 0) return null;

    const handleBack = () => {
        if (wizardStep > 0) {
            setWizardStep(prev => prev - 1);
        } else {
            onBackToEdit();
        }
    };

    const handleSendOrder = async () => {
        setIsSubmitting(true);
        const order = wizardOrders[wizardStep];

        try {
            const orderData = { user_id: user.id, supplier_id: order.supplier.id, order_message: order.message, additional_items: order.additional || null, status: 'sent' };
            const orderItemsToInsert = Object.entries(order.items).filter(([_, quantity]) => quantity && quantity !== '0').map(([productName, quantity]) => ({ product_name: productName, quantity: parseInt(quantity, 10) || 0 }));
            const newOrder = await supabaseHelpers.createOrder(orderData, orderItemsToInsert);
            setNewlyCreatedOrders(prev => [...prev, { ...newOrder, suppliers: order.supplier, order_items: orderItemsToInsert }]);
        } catch (error) {
            console.error('Error saving order from wizard:', error);
            toast.error('Errore durante il salvataggio dell\'ordine.');
        } finally {
            setIsSubmitting(false);
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
                contactLink = generateEmailLink(
                    order.supplier.contact,
                    order.email_subject || order.supplier.email_subject || `Ordine Fornitore - ${order.supplier.name}`,
                    order.message,
                    order.supplier.preferred_email_client
                );
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
            setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', searchTerm: '' }]);
            if (onOrderSent) onOrderSent();
            else navigate('/');
        }
    };

    const handleExit = () => {
        sessionStorage.removeItem('wizardState');
        setShowWizard(false);
        setWizardOrders([]);
        setWizardStep(0);
        setMultiOrders([{ id: Date.now(), supplier: '', items: {}, additional: '', searchTerm: '' }]);
        if (onOrderSent) onOrderSent();
        else navigate('/');
    };

    return (
        <div className="modal-overlay">
            <div className="bg-surface p-6 max-w-sm w-full max-h-96 overflow-y-auto rounded-xl shadow-lg border border-border">
                <h3 className="font-medium text-dark-gray dark:text-gray-100 mb-4">Invio Ordine {wizardStep + 1} di {wizardOrders.length}</h3>
                <div className="bg-surface p-3 rounded-lg shadow-sm border border-border mb-4">
                    <h4 className="font-medium text-dark-gray mb-2">{wizardOrders[wizardStep].supplier?.name || 'Fornitore sconosciuto'}</h4>
                    <pre className="text-sm text-dark-gray whitespace-pre-wrap">{wizardOrders[wizardStep].message}</pre>
                </div>
                <div className="flex space-x-3">
                    {wizardStep === 0 && (
                        <button onClick={handleBack} className="btn btn-outline flex-1"><ChevronLeft size={16} /></button>
                    )}
                    <button onClick={handleSendOrder} disabled={isSubmitting} className={`btn btn-primary ${wizardStep === 0 ? 'flex-1' : 'w-full'}`}>
                        {isSubmitting ? <div className="w-4 h-4 border-2 border-primary-blue border-t-transparent rounded-full animate-spin" /> : <Send size={16} />}<span>{isSubmitting ? 'Invio...' : 'Invia'}</span>
                    </button>
                </div>
                <button onClick={handleExit} className="btn btn-outline w-full mt-4">Esci</button>
            </div>
        </div>
    );
};

export default WizardModal;

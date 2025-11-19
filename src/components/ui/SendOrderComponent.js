
import React from 'react';
import { Send } from 'lucide-react';
import { useOrderFlow } from '../OrderFlow';

// Helper Functions
export const openLinkInNewTab = (url) => {
    const newWindow = window.open(url, '_blank', 'noopener,noreferrer');
    if (newWindow) newWindow.opener = null;
};

const isMobile = () => {
    return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) || window.innerWidth < 768;
};

export const generateEmailLink = (to, subject, body, preferredClient) => {
    const encodedSubject = encodeURIComponent(subject);
    const encodedBody = encodeURIComponent(body);

    switch (preferredClient) {
        case 'gmail': return isMobile() ? `googlegmail://co?to=${to}&subject=${encodedSubject}&body=${encodedBody}` : `https://mail.google.com/mail/?view=cm&fs=1&to=${to}&su=${encodedSubject}&body=${encodedBody}`;
        case 'outlook': return isMobile() ? `ms-outlook://compose?to=${to}&subject=${encodedSubject}&body=${encodedBody}` : `https://outlook.live.com/owa/?path=/mail/action/compose&to=${to}&subject=${encodedSubject}&body=${encodedBody}`;
        default: return `mailto:${to}?subject=${encodedSubject}&body=${encodedBody}`;
    }
};

export const generateOrderMessage = (supplier, items, additional) => {
    if (!supplier) return '';
    let message = supplier.message_template + `\n\n`;
    Object.entries(items).forEach(([product, quantity]) => {
      if (quantity && quantity !== '0') message += `• ${product}: ${quantity}\n`;
    });
    if (additional.trim()) message += additional + '\n';
    message += '\nGrazie!';
    return message;
};


// Main Component
const SendOrderComponent = ({ wizardOrders, wizardStep, isSubmitting, onSend, setWizardStep }) => {
    const { goToStep } = useOrderFlow();
    if (!wizardOrders || wizardOrders.length === 0) return null;

    const order = wizardOrders[wizardStep];
    const isLastStep = wizardStep === wizardOrders.length - 1;

    const handleNext = () => {
        if (isLastStep) {
            goToStep('summary');
        } else {
            setWizardStep(wizardStep + 1);
        }
    };

    return (
        <div className="glass-card p-4">
            <h3 className="font-medium text-dark-gray dark:text-gray-100 mb-4">Invio Ordine {wizardStep + 1} di {wizardOrders.length}</h3>
            <div className="bg-surface p-3 rounded-lg shadow-sm border border-border mb-4">
                <h4 className="font-medium text-dark-gray mb-2">{order.supplier?.name || 'Fornitore sconosciuto'}</h4>
                <pre className="text-sm text-dark-gray whitespace-pre-wrap">{order.message}</pre>
            </div>
            <div className="flex space-x-3">
                <button onClick={() => onSend(handleNext)} disabled={isSubmitting} className="btn btn-primary w-full">
                    {isSubmitting ? <div className="w-4 h-4 border-2 border-blue-600 border-t-transparent rounded-full animate-spin" /> : <Send size={16} />}
                    <span>{isSubmitting ? 'Invio...' : 'Invia e Apri App'}</span>
                </button>
            </div>
        </div>
    );
};

export default SendOrderComponent;

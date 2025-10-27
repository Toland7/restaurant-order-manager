import React from 'react';
import { Send } from 'lucide-react';

const ConfirmOrderModal = ({ showConfirm, confirmMessages, isSubmitting, setShowConfirm, setConfirmMessages, sendOrder, generateOrderMessage }) => {
    if (!showConfirm) return null;

    return (
        <div className="modal-overlay">
            <div className="glass-card p-6 max-w-sm w-full max-h-96 overflow-y-auto">
                <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">{confirmMessages ? 'Conferma Ordini' : 'Conferma Ordine'}</h3>
                <div className="space-y-4 mb-4">
                    {confirmMessages ? confirmMessages.map((msg, index) => (
                        <div key={index} className="bg-gray-50 p-3 rounded-lg">
                            <h4 className="font-medium text-gray-800 mb-2">{msg.supplier}</h4>
                            <pre className="text-sm text-gray-700 whitespace-pre-wrap">{msg.message}</pre>
                        </div>
                    )) : (
                        <div className="bg-gray-50 p-3 rounded-lg">
                            <pre className="text-sm text-gray-700 whitespace-pre-wrap">{generateOrderMessage()}</pre>
                        </div>
                    )}
                </div>
                <div className="flex space-x-3">
                    <button onClick={() => { setShowConfirm(false); setConfirmMessages(null); }} className="btn btn-outline flex-1" disabled={isSubmitting}>Modifica</button>
                    <button onClick={sendOrder} disabled={isSubmitting} className="btn btn-primary flex-1">
                        {isSubmitting ? <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" /> : <Send size={16} />}<span>{isSubmitting ? 'Invio...' : (confirmMessages ? 'Invia Ordini' : 'Invia')}</span>
                    </button>
                </div>
            </div>
        </div>
    );
};

export default ConfirmOrderModal;
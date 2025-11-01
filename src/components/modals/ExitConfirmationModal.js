import React from 'react';
import { AlertTriangle } from 'lucide-react';

const ExitConfirmationModal = ({ showExitConfirm, setShowExitConfirm, onConfirmExit }) => {
    if (!showExitConfirm) return null;

    return (
        <div className="modal-overlay">
            <div className="glass-card p-6 max-w-sm w-full">
                <div className="flex items-center mb-4">
                    <AlertTriangle className="text-yellow-500 mr-3" size={24} />
                    <h3 className="font-medium text-gray-900 dark:text-gray-100">Uscire senza salvare?</h3>
                </div>
                <p className="text-sm text-gray-700 dark:text-gray-300 mb-6">
                    L'ordine in corso verrà perso. Sei sicuro di voler uscire?
                </p>
                <div className="flex space-x-3">
                    <button onClick={() => setShowExitConfirm(false)} className="btn btn-outline flex-1">
                        Annulla
                    </button>
                    <button onClick={onConfirmExit} className="btn btn-danger flex-1">
                        Esci
                    </button>
                </div>
            </div>
        </div>
    );
};

export default ExitConfirmationModal;
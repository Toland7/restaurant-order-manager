import React from 'react';
import { AlertTriangle } from 'lucide-react';
import Modal from '../ui/Modal';

const ExitConfirmationModal = ({ isOpen, onClose, onConfirmExit }) => {
    return (
        <Modal isOpen={isOpen} onClose={onClose}>
            <div className="flex items-center mb-4">
                <AlertTriangle className="text-yellow-500 mr-3" size={24} />
                <h3 className="font-medium text-dark-gray dark:text-gray-100">Uscire senza salvare?</h3>
            </div>
            <p className="text-sm text-dark-gray dark:text-gray-300 mb-6">
                L'ordine in corso verrà perso. Sei sicuro di voler uscire?
            </p>
            <div className="flex space-x-3">
                <button onClick={onClose} className="btn btn-outline flex-1">
                    Annulla
                </button>
                <button onClick={onConfirmExit} className="btn btn-danger flex-1">
                    Esci
                </button>
            </div>
        </Modal>
    );
};

export default ExitConfirmationModal;
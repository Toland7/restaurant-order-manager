import React from 'react';
import { X } from 'lucide-react';

const ConfirmModal = ({ isOpen, onClose, onConfirm, title, message, confirmText = 'Conferma', cancelText = 'Annulla', confirmButtonClass = 'btn-primary' }) => {
    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50 backdrop-blur-sm" onClick={onClose}>
            <div className="bg-white dark:bg-gray-800 rounded-2xl shadow-2xl max-w-md w-full p-6 animate-scale-in" onClick={(e) => e.stopPropagation()}>
                <div className="flex justify-between items-start mb-4">
                    <h3 className="text-lg font-semibold text-gray-900 dark:text-gray-100">{title}</h3>
                    <button onClick={onClose} className="p-1 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-full transition-colors">
                        <X size={20} className="text-gray-500" />
                    </button>
                </div>
                <p className="text-gray-600 dark:text-gray-300 mb-6">{message}</p>
                <div className="flex gap-3 justify-end">
                    <button onClick={onClose} className="btn btn-secondary">
                        {cancelText}
                    </button>
                    <button onClick={() => { onConfirm(); onClose(); }} className={`btn ${confirmButtonClass}`}>
                        {confirmText}
                    </button>
                </div>
            </div>
        </div>
    );
};

export default ConfirmModal;

import React from 'react';

const OrderTypeModal = ({ showTypeModal, setBatchMode, setShowTypeModal }) => {
    if (!showTypeModal) return null;

    return (
        <div className="modal-overlay">
            <div className="glass-card p-6 max-w-sm w-full">
              <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-4">Scegli Tipo Ordine</h3>
              <div className="space-y-3">
                <button onClick={() => { setBatchMode(false); setShowTypeModal(false); }} className="btn btn-primary w-full">Singolo Fornitore</button>
                <button onClick={() => { setBatchMode(true); setShowTypeModal(false); }} className="btn btn-purple w-full">Più Fornitori</button>
              </div>
            </div>
          </div>
    );
};

export default OrderTypeModal;
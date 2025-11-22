import React, { useState } from 'react';
import { Plus, Trash2 } from 'lucide-react';

/**
 * Component for managing additional products (not in the supplier's catalog)
 * Replicates the exact UI style from SuppliersPage product management
 */
const AdditionalProductsInput = ({ items = [], onChange, disabled = false, orderId }) => {
  const [newName, setNewName] = useState('');
  const [newQty, setNewQty] = useState('');

  const addItem = () => {
    if (!newName.trim()) return;
    
    const newItem = {
      name: newName.trim(),
      qty: newQty.trim() || ''
    };
    
    onChange([...items, newItem]);
    setNewName('');
    setNewQty('');
  };

  const handleKeyPress = (e) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      addItem();
    }
  };

  return (
    <>
      <label htmlFor={`new-additional-product-${orderId}`} className="block text-sm font-medium text-gray-700 mb-2">
        Prodotti Aggiuntivi
      </label>
      
      {/* Input per nuovo prodotto aggiuntivo - stile identico a SuppliersPage */}
      <div className="flex space-x-2 mb-3">
        <input
          id={`new-additional-product-${orderId}`}
          name={`new-additional-product-${orderId}`}
          type="text"
          placeholder="Aggiungi prodotto..."
          value={newName}
          onChange={(e) => setNewName(e.target.value)}
          onKeyPress={handleKeyPress}
          className="flex-1 p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          disabled={disabled}
        />
        <input
          id={`new-additional-qty-${orderId}`}
          name={`new-additional-qty-${orderId}`}
          type="text"
          placeholder="Qt."
          value={newQty}
          onChange={(e) => setNewQty(e.target.value)}
          onKeyPress={handleKeyPress}
          className="w-16 p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent text-center"
          disabled={disabled}
        />
        <button
          type="button"
          onClick={addItem}
          className="p-1 bg-blue-500 text-white rounded hover:bg-blue-600 transition-colors flex items-center justify-center shrink-0 self-center"
          disabled={disabled}
          style={{ width: '24px', height: '24px' }}
        >
          <Plus size={12} />
        </button>
      </div>

      {/* Lista prodotti aggiuntivi - stile identico a SuppliersPage */}
      <div className="space-y-2">
        {items.map((item, index) => (
          <div
            key={index}
            className="flex items-center justify-between p-2 bg-gray-50 rounded-lg"
          >
            <span className="text-sm text-gray-700">
              {item.name}{item.qty ? ` - Qt: ${item.qty}` : ''}
            </span>
            <button
              type="button"
              onClick={() => onChange(items.filter((_, i) => i !== index))}
              aria-label={`Rimuovi prodotto ${item.name}`}
              className="p-1 text-red-500 hover:bg-red-100 rounded"
              disabled={disabled}
            >
              <Trash2 size={14} />
            </button>
          </div>
        ))}
      </div>
    </>
  );
};

export default AdditionalProductsInput;



import React from 'react';
import { Download, Upload } from 'lucide-react';

const ProductImportModal = ({ onDownloadTemplate, onFileSelect }) => {
    const fileInputRef = React.useRef(null);

    const handleFileChange = (event) => {
        const file = event.target.files[0];
        if (file) {
            onFileSelect(file);
        }
    };

    return (
        <div className="space-y-4 py-4">
            <p className="text-sm text-gray-500">
                Il file CSV deve contenere un'unica colonna con l'intestazione: <code>product_name</code>.
            </p>
            
            <input
                type="file"
                id="product-csv-upload"
                aria-label="Carica file CSV dei prodotti"
                ref={fileInputRef}
                onChange={handleFileChange}
                className="hidden"
                accept=".csv"
            />

            <div className="flex flex-col space-y-3">
                <button onClick={onDownloadTemplate} className="btn btn-success w-full">
                    <Download className="mr-2 h-4 w-4" /> Scarica Template
                </button>
                <button onClick={() => fileInputRef.current && fileInputRef.current.click()} className="btn btn-primary w-full">
                    <Upload className="mr-2 h-4 w-4" /> Carica File CSV
                </button>
            </div>
        </div>
    );
};

export default ProductImportModal;

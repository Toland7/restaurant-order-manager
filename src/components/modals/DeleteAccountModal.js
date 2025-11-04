import React, { useState } from 'react';

const DeleteAccountModal = ({ isOpen, onClose, onConfirm }) => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');

    if (!isOpen) return null;

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError('');
        if (!email || !password) {
            setError('Per favore, inserisci email e password.');
            return;
        }
        onConfirm(email, password);
    };

    return (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center z-50">
            <div className="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-lg max-w-sm w-full mx-4">
                <h2 className="text-xl font-bold text-red-600 mb-4">Elimina Account</h2>
                <p className="text-gray-700 dark:text-gray-300 mb-4">
                    Sei sul punto di eliminare definitivamente il tuo account. Questa azione è irreversibile e cancellerà tutti i tuoi dati.
                    Per procedere, inserisci la tua email e password per confermare.
                </p>
                <form onSubmit={handleSubmit}>
                    <div className="mb-4">
                        <label htmlFor="email-confirm" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Email</label>
                        <input
                            type="email"
                            id="email-confirm"
                            className="input w-full"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            required
                        />
                    </div>
                    <div className="mb-6">
                        <label htmlFor="password-confirm" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Password</label>
                        <input
                            type="password"
                            id="password-confirm"
                            className="input w-full"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            required
                        />
                    </div>
                    {error && <p className="text-red-500 text-sm mb-4">{error}</p>}
                    <div className="flex justify-end space-x-4">
                        <button
                            type="button"
                            onClick={onClose}
                            className="btn-secondary"
                        >
                            Annulla
                        </button>
                        <button
                            type="submit"
                            className="btn-danger"
                        >
                            Conferma Eliminazione
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
};

export default DeleteAccountModal;

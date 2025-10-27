import React, { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { useNavigate } from 'react-router-dom';
import { supabaseHelpers } from '../supabase';

const AdminPanel = ({ isAdminAuthenticated }) => {
    const navigate = useNavigate();
    const [users, setUsers] = useState([]);
    const [loading, setLoading] = useState(true);
    const [filter, setFilter] = useState('all'); // 'all', 'pending', 'approved', 'rejected'

    useEffect(() => {
        if (!isAdminAuthenticated) {
            navigate('/admin-auth');
            toast.error('Accesso non autorizzato al pannello admin.');
            return;
        }

        const fetchUsers = async () => {
            try {
                setLoading(true);
                const { data, error } = await supabaseHelpers.getUsers();
                if (error) throw error;
                setUsers(data);
            } catch (error) {
                console.error('Error fetching users:', error);
                toast.error('Errore durante il caricamento degli utenti.');
            } finally {
                setLoading(false);
            }
        };
        fetchUsers();
    }, [isAdminAuthenticated, navigate]);

    const handleAction = async (userId, actionType) => {
        try {
            let response;
            switch (actionType) {
                case 'approve':
                    response = await supabaseHelpers.approveUser(userId);
                    toast.success('Utente approvato!');
                    break;
                case 'reject':
                    response = await supabaseHelpers.rejectUser(userId);
                    toast.success('Utente rifiutato!');
                    break;
                case 'revoke':
                    response = await supabaseHelpers.revokeApproval(userId);
                    toast.success('Approvazione revocata!');
                    break;
                case 'delete':
                    if (!window.confirm('Sei sicuro di voler eliminare questo utente? Questa azione è irreversibile.')) return;
                    response = await supabaseHelpers.deleteUser(userId);
                    toast.success('Utente eliminato!');
                    setUsers(prev => prev.filter(u => u.id !== userId));
                    return; // Don't update status for delete
                case 'setAdmin':
                    response = await supabaseHelpers.setAdminStatus(userId, true);
                    toast.success('Utente impostato come admin!');
                    break;
                case 'removeAdmin':
                    response = await supabaseHelpers.setAdminStatus(userId, false);
                    toast.success('Utente rimosso da admin!');
                    break;
                default:
                    break;
            }
            setUsers(prev => prev.map(u => u.id === userId ? { ...u, ...response } : u));
        } catch (error) {
            console.error(`Error performing ${actionType} action:`, error);
            toast.error(`Errore durante l'azione: ${error.message}`);
        }
    };

    const filteredUsers = users.filter(user => {
        if (filter === 'pending') return user.status === 'pending';
        if (filter === 'approved') return user.status === 'approved';
        if (filter === 'rejected') return user.status === 'rejected';
        return true; // 'all'
    });

    return (
        <div className="min-h-screen app-background">
            <Header title="Pannello Admin" onBack={() => navigate('/settings')} />
            <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
                <div className="glass-card p-4">
                    <h3 className="font-medium text-gray-900 dark:text-gray-100 mb-3">Filtra Utenti</h3>
                    <div className="flex space-x-2">
                        <button onClick={() => setFilter('all')} className={`btn ${filter === 'all' ? 'btn-primary' : 'btn-outline'}`}>Tutti</button>
                        <button onClick={() => setFilter('pending')} className={`btn ${filter === 'pending' ? 'btn-warning' : 'btn-outline-warning'}`}>In Attesa</button>
                        <button onClick={() => setFilter('approved')} className={`btn ${filter === 'approved' ? 'btn-success' : 'btn-outline-success'}`}>Approvati</button>
                        <button onClick={() => setFilter('rejected')} className={`btn ${filter === 'rejected' ? 'btn-danger' : 'btn-outline-danger'}`}>Rifiutati</button>
                    </div>
                </div>

                {loading ? (
                    <div className="text-center py-12 text-gray-500">Caricamento utenti...</div>
                ) : filteredUsers.length === 0 ? (
                    <div className="text-center py-12 text-gray-500">Nessun utente trovato con questo filtro.</div>
                ) : (
                    <div className="space-y-4">
                        {filteredUsers.map(user => (
                            <div key={user.id} className="glass-card p-4">
                                <div className="flex justify-between items-start mb-2">
                                    <div>
                                        <p className="font-medium text-gray-900 dark:text-gray-100">{user.email}</p>
                                        <p className="text-sm text-gray-500 dark:text-gray-400">Status: {user.status}</p>
                                        {user.is_admin && <span className="px-2 py-1 text-xs rounded-full bg-blue-100 text-blue-800">Admin</span>}
                                    </div>
                                    <div className="flex space-x-2">
                                        {user.status === 'pending' && (
                                            <>
                                                <button onClick={() => handleAction(user.id, 'approve')} className="btn btn-success btn-sm">Approva</button>
                                                <button onClick={() => handleAction(user.id, 'reject')} className="btn btn-danger btn-sm">Rifiuta</button>
                                            </>
                                        )}
                                        {user.status === 'approved' && (
                                            <button onClick={() => handleAction(user.id, 'revoke')} className="btn btn-warning btn-sm">Revoca</button>
                                        )}
                                        {!user.is_admin ? (
                                            <button onClick={() => handleAction(user.id, 'setAdmin')} className="btn btn-info btn-sm">Rendi Admin</button>
                                        ) : (
                                            <button onClick={() => handleAction(user.id, 'removeAdmin')} className="btn btn-outline-info btn-sm">Rimuovi Admin</button>
                                        )}
                                        <button onClick={() => handleAction(user.id, 'delete')} className="btn btn-danger btn-sm">Elimina</button>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </div>
    );
};

export default AdminPanel;

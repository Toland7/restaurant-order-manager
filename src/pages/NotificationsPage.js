import React, { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import Header from '../components/ui/Header';
import { supabaseHelpers } from '../supabase';
import { useNavigate } from 'react-router-dom';

const NotificationsPage = ({ user, handleNotificationClick }) => {
    console.log('NotificationsPage: user prop', user);
    const navigate = useNavigate();
    const [notifications, setNotifications] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchNotifications = async () => {
            if (user) {
                try {
                    setLoading(true);
                    console.log('🔕 Calling supabaseHelpers.getAllNotifications with userId:', user.id);
                    const data = await supabaseHelpers.getAllNotifications(user.id);
                    console.log('🔕 Data from getAllNotifications:', data);
                    setNotifications(data || []);
                } catch (error) {
                    console.error('Error fetching notifications:', error);
                    toast.error('Errore durante il caricamento delle notifiche.');
                } finally {
                    setLoading(false);
                }
            }
        };
        fetchNotifications();
    }, [user]);

    const markAsRead = async (id) => {
        try {
            await supabaseHelpers.markNotificationAsRead(id);
            setNotifications(prev => prev.map(n => n.id === id ? { ...n, is_read: true } : n));
        } catch (error) {
            console.error('Error marking notification as read:', error);
            toast.error('Errore durante l\'aggiornamento della notifica.');
        }
    };

    const deleteNotification = async (id) => {
        if (!window.confirm('Sei sicuro di voler eliminare questa notifica?')) return;
        try {
            await supabaseHelpers.deleteNotification(id);
            setNotifications(prev => prev.filter(n => n.id !== id));
            toast.success('Notifica eliminata.');
        } catch (error) {
            console.error('Error deleting notification:', error);
            toast.error('Errore durante l\'eliminazione della notifica.');
        }
    };

    return (
        <div className="min-h-screen app-background">
            <Header title="Notifiche" onBack={() => navigate('/')} />
            <div className="max-w-sm mx-auto px-6 py-6 space-y-4">
                {loading ? (
                    <div className="text-center py-12 text-gray-500">Caricamento notifiche...</div>
                ) : notifications.length === 0 ? (
                    <div className="text-center py-12 text-gray-500">Nessuna notifica.</div>
                ) : (
                    notifications.map(notification => (
                        <div key={notification.id} className={`glass-card p-4 ${!notification.is_read ? 'bg-blue-50 dark:bg-blue-900/20' : ''}`}>
                            <div className="flex justify-between items-start mb-2">
                                <p className="font-medium text-gray-900 dark:text-gray-100">{notification.title}</p>
                                <span className="text-xs text-gray-500 dark:text-gray-400">{new Date(notification.created_at).toLocaleDateString()}</span>
                            </div>
                            <p className="text-sm text-gray-700 dark:text-gray-300 mb-3">{notification.message}</p>
                            <div className="flex justify-end space-x-2">
                                {!notification.is_read && (
                                    <button onClick={() => markAsRead(notification.id)} className="text-blue-500 hover:text-blue-600 text-sm">Segna come letta</button>
                                )}
                                {notification.reminder_id && (
                                    <button onClick={() => handleNotificationClick(notification)} className="text-green-500 hover:text-green-600 text-sm">Visualizza Ordine</button>
                                )}
                                <button onClick={() => deleteNotification(notification.id)} className="text-red-500 hover:text-red-600 text-sm">Elimina</button>
                            </div>
                        </div>
                    ))
                )}
            </div>
        </div>
    );
};

export default NotificationsPage;

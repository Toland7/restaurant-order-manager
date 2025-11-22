import React, { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import { Check, ChevronDown } from 'lucide-react';
import Header from '../components/ui/Header';
import { supabaseHelpers } from '../supabase';
import { useNotifications } from '../hooks/useNotifications';
import { usePrefill } from '../PrefillContext';
import { useNavigate } from 'react-router-dom';
import { useAutoAnimate } from '@formkit/auto-animate/react';

import logger from '../utils/logger';
const NotificationsPage = ({ user }) => {
    const navigate = useNavigate();
    const { setPrefilledData } = usePrefill();
    const { unreadCount, setUnreadCount, handleNotificationClick } = useNotifications(user, setPrefilledData, navigate);
    const [notifications, setNotifications] = useState([]);
    const [loading, setLoading] = useState(true);
    const [unreadParent] = useAutoAnimate();
    const [readParent] = useAutoAnimate();

    useEffect(() => {
        const fetchAndCleanNotifications = async () => {
            if (!user) return;
            try {
                setLoading(true);
                const data = await supabaseHelpers.getNotifications(user.id);

                const now = new Date();
                const twentyFourHoursAgo = new Date(now.getTime() - 24 * 60 * 60 * 1000);

                const oldReadNotifications = data.filter(n => {
                    const notificationDate = new Date(n.created_at);
                    return n.is_read && notificationDate < twentyFourHoursAgo;
                });

                if (oldReadNotifications.length > 0) {
                    const idsToDelete = oldReadNotifications.map(n => n.id);
                    await Promise.all(idsToDelete.map(id => supabaseHelpers.deleteNotification(id)));

                    const currentNotifications = data.filter(n => !idsToDelete.includes(n.id));
                    setNotifications(currentNotifications);
                } else {
                    setNotifications(data);
                }
            } catch (error) {
                logger.error('Error fetching or cleaning notifications:', error);
                toast.error('Errore durante il caricamento delle notifiche.');
            } finally {
                setLoading(false);
            }
        };
        fetchAndCleanNotifications();
    }, [user]);

    const markAsRead = async (id) => {
        try {
            await supabaseHelpers.markNotificationAsRead(id);
            setNotifications(prev => prev.map(n => n.id === id ? { ...n, is_read: true } : n));
            const newCount = Math.max(0, unreadCount - 1);
            setUnreadCount(newCount);
            if ('setAppBadge' in navigator) {
                navigator.setAppBadge(newCount);
            }
        } catch (error) {
            logger.error('Error marking notification as read:', error);
            toast.error('Errore durante l\'aggiornamento della notifica.');
        }
    };

    const handleMarkAllAsRead = async () => {
        const unreadIds = notifications.filter(n => !n.is_read).map(n => n.id);
        if (unreadIds.length === 0) return;

        try {
            await Promise.all(unreadIds.map(id => supabaseHelpers.markNotificationAsRead(id)));
            setNotifications(prev => prev.map(n => ({ ...n, is_read: true })));
            setUnreadCount(0);
            if ('clearAppBadge' in navigator) {
                navigator.clearAppBadge();
            }
            toast.success('Tutte le notifiche sono state segnate come lette.');
        } catch (error) {
            logger.error('Error marking all as read:', error);
            toast.error('Errore durante l\'archiviazione delle notifiche.');
        }
    };



    const unreadNotifications = notifications.filter(n => !n.is_read);
    const readNotifications = notifications.filter(n => n.is_read);

    return (
        <div className="min-h-screen app-background">
            <Header title="Notifiche" onBack={() => navigate('/')} />
            <div className="max-w-sm mx-auto px-6 py-6">
                <div className="flex justify-between items-center mb-6">
                    <h2 className="text-lg font-medium text-gray-900 dark:text-gray-100">Centro Notifiche</h2>
                    {unreadCount > 0 && (
                        <button onClick={handleMarkAllAsRead} className="text-sm text-blue-500 dark:text-blue-400 hover:underline">
                            Segna tutte come lette
                        </button>
                    )}
                </div>

                {loading ? (
                    <p className="text-center text-gray-500">Caricamento notifiche...</p>
                ) : notifications.length === 0 ? (
                    <div className="text-center py-12">
                        <p className="text-gray-500">Nessuna notifica presente.</p>
                    </div>
                ) : (
                    <div className="space-y-4">
                        {unreadNotifications.length > 0 && (
                            <div ref={unreadParent} className="space-y-3">
                                {unreadNotifications.map(notification => (
                                    <div key={notification.id} className="bg-white dark:bg-gray-800 rounded-xl p-4 shadow-sm border-l-4 border-blue-500 transition-all hover:shadow-md">
                                        <div className="flex justify-between items-start gap-4">
                                            <div className="flex-1">
                                                <h3 className="font-medium text-gray-800 dark:text-gray-200">{notification.title}</h3>
                                                <p className="text-xs text-gray-500 mt-1">{new Date(notification.created_at).toLocaleString('it-IT', { dateStyle: 'medium', timeStyle: 'short' })}</p>
                                                <p className="text-sm text-gray-600 dark:text-gray-400 mt-2">{notification.message}</p>
                                                {(notification.reminder_id || (notification.data && (notification.data.reminder_id || notification.data.reminder_ids))) && (
                                                    <button onClick={() => handleNotificationClick(notification)} className="mt-2 text-sm font-medium text-blue-600 hover:underline">
                                                        Visualizza ordine
                                                    </button>
                                                )}
                                            </div>
                                            <button onClick={() => markAsRead(notification.id)} className="p-1 text-gray-400 hover:text-gray-600 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-full">
                                                <Check size={18} />
                                            </button>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}
                        {readNotifications.length > 0 && (
                            <details className="mt-8 group">
                                <summary className="font-medium text-gray-500 cursor-pointer flex justify-between items-center list-none">
                                    <h3 className="text-sm mb-3">Archivio (Ultime 24 ore)</h3>
                                    <ChevronDown className="transform transition-transform duration-200 group-open:rotate-180" size={16} />
                                </summary>
                                <div ref={readParent} className="space-y-3 mt-3">
                                    {readNotifications.map(notification => (
                                        <div key={notification.id} className="bg-white dark:bg-gray-800 rounded-xl p-4 shadow-sm opacity-60">
                                            <h3 className="font-medium text-gray-700 dark:text-gray-300">{notification.title}</h3>
                                            <p className="text-xs text-gray-500 mt-1">{new Date(notification.created_at).toLocaleString('it-IT', { dateStyle: 'medium', timeStyle: 'short' })}</p>
                                            <p className="text-sm text-gray-600 dark:text-gray-400 mt-2">{notification.message}</p>
                                        </div>
                                    ))}
                                </div>
                            </details>
                        )}
                    </div>
                )}
            </div>
        </div>
    );
};

export default NotificationsPage;

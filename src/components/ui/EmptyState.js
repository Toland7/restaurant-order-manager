import React from 'react';

const EmptyState = ({ icon: Icon, title, message, actionText, onActionClick }) => {
  return (
    <div className="text-center py-12 px-6 bg-white dark:bg-gray-800/50 rounded-lg shadow-sm">
      {Icon && <Icon size={48} className="mx-auto text-gray-300 dark:text-gray-600 mb-4" />}
      {title && <h3 className="text-lg font-medium text-gray-900 dark:text-gray-100 mb-1">{title}</h3>}
      {message && <p className="text-gray-500 dark:text-gray-400 mb-6">{message}</p>}
      {actionText && onActionClick && (
        <button 
          onClick={onActionClick} 
          className="btn btn-primary"
        >
          {actionText}
        </button>
      )}
    </div>
  );
};

export default EmptyState;

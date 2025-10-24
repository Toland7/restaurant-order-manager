
import React from 'react';
import { Link } from 'react-router-dom';
import { ChevronLeft } from 'lucide-react';

const LegalPageLayout = ({ title, children }) => {
  return (
    <div className="min-h-screen app-background">
      <div className="backdrop-blur bg-white/60 dark:bg-black/40 border-b border-white/60 dark:border-white/10 sticky top-0 z-10">
        <div className="max-w-4xl mx-auto px-6 py-4 flex items-center">
          <Link to="/" className="-ml-2 p-2 rounded-md hover:bg-gray-200/50 flex items-center space-x-2 text-sm font-medium text-gray-700">
            <ChevronLeft size={20} />
            <span>Home</span>
          </Link>
          <h2 className="text-lg font-medium text-gray-900 dark:text-gray-100 mx-auto pr-20">{title}</h2>
        </div>
      </div>
      {children}
    </div>
  );
};

export default LegalPageLayout;

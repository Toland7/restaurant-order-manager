import React from 'react';
import DesktopSidebar from './DesktopSidebar';

const ResponsiveLayout = ({ children, unreadCount }) => {
  return (
    <div className="min-h-screen bg-gray-50 dark:bg-gray-900 transition-colors duration-200">
      {/* Desktop Sidebar - Hidden on mobile, visible on lg screens */}
      <DesktopSidebar unreadCount={unreadCount} />

      {/* Main Content Area */}
      <main className="lg:pl-64 min-h-screen transition-all duration-200">
        {/* 
          We add a specific ID or class here to help us target 
          and override the mobile-specific styles (max-w-sm) via CSS 
        */}
        <div className="desktop-content-wrapper h-full">
          {children}
        </div>
      </main>
    </div>
  );
};

export default ResponsiveLayout;

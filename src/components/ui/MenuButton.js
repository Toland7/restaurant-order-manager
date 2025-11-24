import { ChevronRight } from 'lucide-react';

const MenuButton = ({ icon, title, subtitle, onClick, color, tourId }) => (
    <button 
      onClick={onClick} 
      data-tour={tourId}
      className="w-full glass-card border border-white/60 p-6 text-left transition-all duration-300 hover:-translate-y-0.5 hover:shadow-md group" 
      aria-label={`${title}: ${subtitle}`}
    >
      <div className="flex items-center space-x-4">
        <div className={`rounded-2xl p-3 text-white bg-gradient-to-br ${color} ring-1 ring-white/60 shadow-inner`}>{icon}</div>
        <div className="flex-1">
          <h3 className="font-medium text-gray-900 text-sm">{title}</h3>
          <p className="text-gray-500 text-xs mt-1">{subtitle}</p>
        </div>
        <ChevronRight size={20} className="text-gray-300" aria-hidden="true" />
      </div>
    </button>
  );

export default MenuButton;
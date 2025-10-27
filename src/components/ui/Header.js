import { ChevronLeft } from 'lucide-react';

const Header = ({ title, onBack }) => (
    <div className="backdrop-blur bg-white/60 dark:bg-black/40 border-b border-white/60 dark:border-white/10 sticky top-0 z-10">
      <div className="max-w-sm mx-auto px-6 py-4 flex items-center">
        <button onClick={onBack} className="-ml-2 icon-btn"><ChevronLeft size={24} /></button>
        <h2 className="text-lg font-medium text-gray-900 dark:text-gray-100 mx-auto pr-10">{title}</h2>
      </div>
    </div>
  );

export default Header;
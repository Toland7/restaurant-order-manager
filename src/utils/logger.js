/**
 * Conditional logger utility
 * Logs only in development environment to prevent information disclosure in production
 */

const isDevelopment = process.env.NODE_ENV === 'development';

export const logger = {
  log: (...args) => {
    if (isDevelopment) {
      console.log(...args);
    }
  },
  
  error: (...args) => {
    if (isDevelopment) {
      console.error(...args);
    }
  },
  
  warn: (...args) => {
    if (isDevelopment) {
      console.warn(...args);
    }
  },
  
  info: (...args) => {
    if (isDevelopment) {
      console.info(...args);
    }
  },
  
  // Always log errors to help with production debugging via error tracking services
  // Use this for errors that should be caught by Sentry
  errorAlways: (...args) => {
    console.error(...args);
  }
};

export default logger;

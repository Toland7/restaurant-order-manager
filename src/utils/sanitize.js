import DOMPurify from 'dompurify';

/**
 * Sanitization utilities using DOMPurify
 * Prevents XSS attacks by cleaning user input
 */

/**
 * Sanitize HTML content
 * Removes potentially dangerous HTML/JavaScript
 * @param {string} dirty - Unsanitized input
 * @returns {string} - Sanitized output
 */
export const sanitizeHtml = (dirty) => {
  if (typeof dirty !== 'string') return '';
  return DOMPurify.sanitize(dirty, {
    ALLOWED_TAGS: [], // No HTML tags allowed
    ALLOWED_ATTR: []
  });
};

/**
 * Sanitize text input (removes all HTML)
 * Use for plain text fields
 * @param {string} input - User input
 * @returns {string} - Sanitized text
 */
export const sanitizeText = (input) => {
  if (typeof input !== 'string') return '';
  return DOMPurify.sanitize(input, {
    ALLOWED_TAGS: [],
    ALLOWED_ATTR: [],
    KEEP_CONTENT: true
  }).trim();
};

/**
 * Sanitize email
 * @param {string} email - Email input
 * @returns {string} - Sanitized email
 */
export const sanitizeEmail = (email) => {
  if (typeof email !== 'string') return '';
  return sanitizeText(email).toLowerCase();
};

/**
 * Sanitize phone number (keep only digits, +, -, spaces, parentheses)
 * @param {string} phone - Phone number input
 * @returns {string} - Sanitized phone
 */
export const sanitizePhone = (phone) => {
  if (typeof phone !== 'string') return '';
  return phone.replace(/[^0-9+\-\s()]/g, '').trim();
};

/**
 * Sanitize numeric input
 * @param {string|number} value - Numeric input
 * @returns {string} - Sanitized number as string
 */
export const sanitizeNumber = (value) => {
  if (typeof value === 'number') return value.toString();
  if (typeof value !== 'string') return '';
  return value.replace(/[^0-9.,]/g, '').trim();
};

/**
 * Sanitize object with multiple fields
 * @param {Object} obj - Object with fields to sanitize
 * @param {Object} schema - Schema defining sanitization for each field
 * @returns {Object} - Sanitized object
 */
export const sanitizeObject = (obj, schema) => {
  const sanitized = {};
  
  for (const [key, sanitizer] of Object.entries(schema)) {
    if (obj.hasOwnProperty(key)) {
      sanitized[key] = sanitizer(obj[key]);
    }
  }
  
  return sanitized;
};

const sanitizeUtils = {
  sanitizeHtml,
  sanitizeText,
  sanitizeEmail,
  sanitizePhone,
  sanitizeNumber,
  sanitizeObject
};

export default sanitizeUtils;

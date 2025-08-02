// app.js
const appName = process.env.APP_NAME || 'Unknown App';
const environment = process.env.ENVIRONMENT || 'development';

console.log(`Running ${appName} in ${environment} mode...`);
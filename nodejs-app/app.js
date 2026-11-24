const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.status(200).send(`
    <!DOCTYPE html>
    <html>
      <head>
        <title>Node.js DevOps Application</title>
      </head>
      <body>
        <h1>Node.js Application Deployed Successfully!</h1>
        <p>Continuous Integration and Continuous Deployment with GitHub Actions and AWS.</p>
        <p>Status: Running</p>
      </body>
    </html>
  `);
});

app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'healthy',
    application: 'nodejs-cloud-deployment'
  });
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Node.js application listening on port ${PORT}`);
});

module.exports = app;

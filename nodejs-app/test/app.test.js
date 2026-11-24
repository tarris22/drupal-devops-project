const test = require('node:test');
const assert = require('node:assert');

test('Node.js application test configuration is valid', () => {
  const packageData = require('../package.json');

  assert.strictEqual(packageData.name, 'nodejs-cloud-deployment');
  assert.ok(packageData.scripts.start);
  assert.ok(packageData.scripts.test);
});

// test_script.js

const assert = require('assert');

describe('Basic Math Operations', function() {
    it('should add two numbers correctly', function() {
        assert.strictEqual(1 + 1, 2);
    });

    it('should subtract two numbers correctly', function() {
        assert.strictEqual(5 - 3, 2);
    });

    it('should multiply two numbers correctly', function() {
        assert.strictEqual(2 * 3, 6);
    });

    it('should divide two numbers correctly', function() {
        assert.strictEqual(6 / 2, 3);
    });
});

// Run tests using a test runner like Mocha
// Command: mocha test_script.js

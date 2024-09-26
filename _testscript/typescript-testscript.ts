// test_script.ts

import { expect } from 'chai';
import 'mocha';

describe('Basic Math Operations', () => {
    it('should add two numbers correctly', () => {
        expect(1 + 1).to.equal(2);
    });

    it('should subtract two numbers correctly', () => {
        expect(5 - 3).to.equal(2);
    });

    it('should multiply two numbers correctly', () => {
        expect(2 * 3).to.equal(6);
    });

    it('should divide two numbers correctly', () => {
        expect(6 / 2).to.equal(3);
    });
});

// Run tests using: mocha -r ts-node/register test_script.ts
// Make sure to install: npm install --save-dev typescript ts-node mocha @types/mocha chai @types/chai

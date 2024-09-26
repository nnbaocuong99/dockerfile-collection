// TestScript.groovy

import groovy.test.GroovyTestCase

class TestScript extends GroovyTestCase {
    void testAddition() {
        assertEquals(2, 1 + 1)
    }

    void testSubtraction() {
        assertEquals(0, 1 - 1)
    }

    void testMultiplication() {
        assertEquals(6, 2 * 3)
    }

    void testDivision() {
        assertEquals(2, 6 / 3)
    }
}

// Run tests using: groovy TestScript.groovy

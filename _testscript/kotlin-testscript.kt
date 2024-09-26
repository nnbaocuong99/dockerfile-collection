// TestScript.kt

import org.junit.jupiter.api.Test
import kotlin.test.assertEquals

class TestScript {
    @Test
    fun testAddition() {
        assertEquals(2, 1 + 1)
    }

    @Test
    fun testSubtraction() {
        assertEquals(2, 5 - 3)
    }

    @Test
    fun testMultiplication() {
        assertEquals(6, 2 * 3)
    }

    @Test
    fun testDivision() {
        assertEquals(3, 6 / 2)
    }
}

// Run tests using JUnit 5 with your preferred build tool (e.g., Gradle or Maven)
// Make sure to include the kotlin.test dependency in your build file

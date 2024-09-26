// TestScript.java

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestScript {
    @Test
    public void testAddition() {
        assertEquals(2, 1 + 1);
    }

    @Test
    public void testSubtraction() {
        assertEquals(2, 5 - 3);
    }

    @Test
    public void testMultiplication() {
        assertEquals(6, 2 * 3);
    }

    @Test
    public void testDivision() {
        assertEquals(3, 6 / 2);
    }
}

// To run tests, use JUnit 5 with your preferred build tool or IDE

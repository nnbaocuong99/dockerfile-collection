import haxe.unit.TestCase;
import haxe.unit.TestRunner;

class ExampleTest extends TestCase {
    public function testAddition() {
        assertEquals(4, 2 + 2);
    }

    public function testStringConcatenation() {
        assertEquals("Hello, World!", "Hello, " + "World!");
    }

    public function testArrayOperations() {
        var arr = [1, 2, 3];
        assertEquals(3, arr.length);
        assertTrue(arr.indexOf(2) != -1);
    }
}

class TestScript {
    public static function main() {
        Sys.println("Running Haxe tests...");

        var runner = new TestRunner();
        runner.add(new ExampleTest());

        var success = runner.run();

        Sys.println("Tests run: " + runner.result.total);
        Sys.println("Tests passed: " + (runner.result.total - runner.result.failures));
        Sys.println("Tests failed: " + runner.result.failures);

        if (!success) {
            Sys.exit(1);
        }
    }
}

// To compile: haxe -main TestScript -neko testscript.n
// To run: neko testscript.n

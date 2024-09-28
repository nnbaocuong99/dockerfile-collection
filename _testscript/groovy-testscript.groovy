import groovy.test.GroovyTestCase

class ExampleTestCase extends GroovyTestCase {
    void testAddition() {
        assertEquals(4, 2 + 2)
    }

    void testStringConcatenation() {
        assertEquals("Hello, World!", "Hello, " + "World!")
    }

    void testList() {
        def list = [1, 2, 3]
        assertTrue(list.contains(2))
        assertEquals(3, list.size())
    }
}

// Custom test runner
def runTests() {
    println "Running Groovy tests..."
    def testCase = new ExampleTestCase()
    def methods = ExampleTestCase.methods.findAll { it.name.startsWith("test") }
    
    def passed = 0
    def failed = 0

    methods.each { method ->
        try {
            testCase."$method.name"()
            println "Test ${method.name} passed"
            passed++
        } catch (AssertionError e) {
            println "Test ${method.name} failed: ${e.message}"
            failed++
        }
    }

    println "Tests run: ${passed + failed}"
    println "Tests passed: $passed"
    println "Tests failed: $failed"
}

runTests()

// To run: groovy testscript.groovy

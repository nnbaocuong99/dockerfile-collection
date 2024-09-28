import ceylon.test { test, assertEquals, assertTrue }

test
shared void testAddition() {
    assertEquals(2 + 2, 4);
}

test
shared void testStringConcatenation() {
    assertEquals("Hello, " + "World!", "Hello, World!");
}

test
shared void testSequenceOperations() {
    value sequence = [1, 2, 3];
    assertEquals(sequence.size, 3);
    assertTrue(sequence.contains(2));
}

"Run the tests"
shared void run() {
    print("Running Ceylon tests...");
    
    value results = ceylon.test.run([
        `testAddition`,
        `testStringConcatenation`,
        `testSequenceOperations`
    ]);
    
    print("Tests run: ``results.runCount``");
    print("Tests passed: ``results.successCount``");
    print("Tests failed: ``results.errorCount + results.failureCount``");
}

// To compile: ceylon compile testscript.ceylon
// To run: ceylon run testscript

import unittest

suite "Example tests":
  test "addition":
    check(2 + 2 == 4)

  test "string concatenation":
    check("Hello, " & "World!" == "Hello, World!")

  test "sequence operations":
    let seq1 = @[1, 2, 3]
    check(seq1.len == 3)
    check(2 in seq1)

# Custom test runner
proc runTests() =
  echo "Running Nim tests..."
  var ts = newTestSuite("custom")
  ts.addTest(suite "Example tests")
  
  var passedTests = 0
  var failedTests = 0

  for test in ts.tests:
    if test.kind == tkTest:
      try:
        test.testBody()
        echo "Test '", test.name, "' passed"
        inc passedTests
      except AssertionDefect:
        echo "Test '", test.name, "' failed"
        inc failedTests

  echo "Tests run: ", passedTests + failedTests
  echo "Tests passed: ", passedTests
  echo "Tests failed: ", failedTests

when isMainModule:
  runTests()

# To compile and run: nim c -r testscript.nim

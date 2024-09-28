use "ponytest"

class iso _TestAddition is UnitTest
  fun name(): String => "addition"

  fun apply(h: TestHelper) =>
    h.assert_eq[U8](4, 2 + 2)

class iso _TestStringConcatenation is UnitTest
  fun name(): String => "string concatenation"

  fun apply(h: TestHelper) =>
    h.assert_eq[String]("Hello, World!", "Hello, " + "World!")

class iso _TestArrayOperations is UnitTest
  fun name(): String => "array operations"

  fun apply(h: TestHelper) =>
    let arr = [1; 2; 3]
    h.assert_eq[USize](3, arr.size())
    h.assert_true(arr.contains(2))

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestAddition)
    test(_TestStringConcatenation)
    test(_TestArrayOperations)

  fun tag _print_results(env: Env, passed: USize, failed: USize) =>
    env.out.print("Running Pony tests...")
    env.out.print("Tests run: " + (passed + failed).string())
    env.out.print("Tests passed: " + passed.string())
    env.out.print("Tests failed: " + failed.string())

// To compile: ponyc
// To run: ./testscript

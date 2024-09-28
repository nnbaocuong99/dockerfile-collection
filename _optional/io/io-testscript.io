TestCase := Object clone do(
    assertEqual := method(expected, actual,
        if(expected != actual,
            Exception raise("Expected " .. expected .. " but got " .. actual)
        )
    )

    assertTrue := method(condition,
        if(condition not,
            Exception raise("Expected true but got false")
        )
    )
)

ExampleTest := TestCase clone do(
    testAddition := method(
        assertEqual(4, 2 + 2)
    )

    testStringConcatenation := method(
        assertEqual("Hello, World!", "Hello, " .. "World!")
    )

    testListOperations := method(
        list := list(1, 2, 3)
        assertEqual(3, list size)
        assertTrue(list contains(2))
    )
)

TestRunner := Object clone do(
    run := method(
        "Running Io tests..." println
        passed := 0
        failed := 0

        ExampleTest slotNames foreach(methodName,
            if(methodName beginsWith("test"),
                try(
                    ExampleTest performWithArgList(methodName, list())
                    ("Test '" .. methodName .. "' passed") println
                    passed = passed + 1
                ) catch(Exception,
                    ("Test '" .. methodName .. "' failed: " .. exception message) println
                    failed = failed + 1
                )
            )
        )

        ("Tests run: " .. (passed + failed)) println
        ("Tests passed: " .. passed) println
        ("Tests failed: " .. failed) println
    )
)

TestRunner run

# To run: io testscript.io

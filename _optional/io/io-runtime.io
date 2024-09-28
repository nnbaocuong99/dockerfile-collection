Runtime := Object clone do(
    main := method(
        "Io Runtime Environment" println
        ("Io version: " .. System version) println
        ("Current working directory: " .. System getWorkingDirectory) println
        ("Operating System: " .. System platform) println
        ("CPU Architecture: " .. System architecture) println

        # Measure execution time
        startTime := Date secondsToRun(
            # Add your application logic here
            # For example:
            # App start
        )

        ("Execution time: " .. startTime .. " seconds") println
    )
)

Runtime main

# To run: io runtime.io

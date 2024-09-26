// RUNTIME file for F#

open System

[<EntryPoint>]
let main argv =
    // Set environment variables
    Environment.SetEnvironmentVariable("APP_ENV", "production")

    // Main application logic
    printfn "F# Runtime Environment"
    printfn "F# version: %A" (LanguagePrimitives.GenericZero : int)  // F# doesn't have a version function, but you can print the runtime
    printfn "Current working directory: %s" (Environment.CurrentDirectory)

    // Add your application logic here
    // MyApp.run()

    0  // return an integer exit code

use "time"
use "files"

actor Main
  new create(env: Env) =>
    env.out.print("Pony Runtime Environment")
    env.out.print("Pony version: " + env.root.version())
    try
      env.out.print("Current working directory: " + Path.cwd()?)
    end
    env.out.print("Operating System: " + Platform.os())
    env.out.print("CPU Architecture: " + Platform.arch())

    let start_time = Time.nanos()

    // Add your application logic here
    // For example:
    // App.start(env)

    let end_time = Time.nanos()
    env.out.print("Execution time: " + ((end_time - start_time).f64() / 1e9).string() + " seconds")

// To compile: ponyc
// To run: ./runtime

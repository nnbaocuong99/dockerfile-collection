// main.rs

use std::env;

fn main() {
    println!("Rust Runtime Environment");
    println!("Rust version: {}", rustc_version());
    println!("Current working directory: {:?}", env::current_dir().unwrap());
    println!("Operating system: {}", std::env::consts::OS);
    println!("Architecture: {}", std::env::consts::ARCH);

    // Add your application logic here
    // For example:
    // app::start();
}

fn rustc_version() -> String {
    let version = rustc_version::version().unwrap();
    format!("{}.{}.{}", version.major, version.minor, version.patch)
}

// Add this to Cargo.toml:
// [dependencies]
// rustc_version = "0.4"

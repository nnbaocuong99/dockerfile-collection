// main.swift

import Foundation

func main() {
    print("Swift Runtime Environment")
    print("Swift version: \(swiftVersion)")
    print("Current working directory: \(FileManager.default.currentDirectoryPath)")
    print("Operating system: \(operatingSystem)")

    // Add your application logic here
    // For example:
    // App.start()
}

let swiftVersion = """
    \(ProcessInfo.processInfo.environment["SWIFT_VERSION"] ?? "Unknown")
    """

let operatingSystem = """
    \(ProcessInfo.processInfo.operatingSystemVersionString)
    """

main()

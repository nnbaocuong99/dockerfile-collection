// TestScript.swift

import XCTest

class TestScript: XCTestCase {
    func testAddition() {
        XCTAssertEqual(1 + 1, 2)
    }

    func testSubtraction() {
        XCTAssertEqual(5 - 3, 2)
    }

    func testMultiplication() {
        XCTAssertEqual(2 * 3, 6)
    }

    func testDivision() {
        XCTAssertEqual(6 / 2, 3)
    }
}

// Run tests using: swift test
// Make sure you have a Package.swift file set up for your Swift package

import XCTest
@testable import CountryCode

final class CountryCodeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CountryCode().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

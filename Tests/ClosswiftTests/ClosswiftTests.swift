import XCTest
@testable import Closswift

final class ClosswiftTests: XCTestCase {
    
    func testStrings() {
        let bar: Optional<String> = "bar"
        XCTAssertEqual(
            closs("foo", bar, "baz"),
            "foo bar baz")
    }
    
    func testDictionaries() {
        XCTAssertTrue(["foo baz", "baz foo"].contains(
                        closs(["foo" : true, "bar" : false], ["baz" : isTrue()])))
        XCTAssertEqual(
            closs(["foo" : true], ["bar" : false], String?.none, ["--foobar" : true]),
            "foo --foobar")
    }
    
    func testArrays() {
        XCTAssertEqual(
            closs("foo", 0 , false, "bar"),
            "foo bar")
        XCTAssertEqual(
            closs(["foo"], ["", 0, false, "bar"]),
            "foo bar")
    }
    
    func testClassnames() {
        XCTAssertEqual(
            closs("foo bar", "buz"),
            "foo bar buz")
    }
    
    private func isTrue() -> Bool {
        true
    }

    static var allTests = [
        ("testStrings", testStrings),
        ("testDictionaries", testDictionaries),
        ("testArrays", testArrays),
    ]
}

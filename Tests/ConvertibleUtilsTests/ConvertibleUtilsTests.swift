
import XCTest
@testable import ConvertibleUtils

final class ConvertibleUtilsTests: XCTestCase {

    // MARK: - Int conversions

    func testInt_toDouble_toString_toFloat() {
        let x: Int = 42
        XCTAssertEqual(x.toDouble, 42.0, accuracy: 0.000_001)
        XCTAssertEqual(x.toString, "42")
        XCTAssertEqual(x.toFloat, 42.0, accuracy: 0.000_001)
    }

    // MARK: - Double conversions

    func testDouble_toInt_toString_toFloat() {
        let x: Double = 42.9
        XCTAssertEqual(x.toInt, 42) // truncates
        XCTAssertEqual(x.toString, "42.9")
        XCTAssertEqual(x.toFloat, Float(42.9), accuracy: 0.000_1)
    }

    // MARK: - Float conversions

    func testFloat_toInt_toString_toDouble() {
        let x: Float = 12.75
        XCTAssertEqual(x.toInt, 12) // truncates
        XCTAssertEqual(x.toString, "12.75")
        XCTAssertEqual(x.toDouble, 12.75, accuracy: 0.000_001)
    }

    // MARK: - String -> numbers

    func testString_toInt_optional_and_value() {
        XCTAssertEqual("123".toInt, 123)
        XCTAssertNil("123a".toInt)
        XCTAssertEqual("123".toIntValue, 123)
        XCTAssertEqual("abc".toIntValue, 0) // fallback to 0 by design
    }

    func testString_toFloat_optional_and_value() {
        XCTAssertNil("pi".toFloat)
        XCTAssertEqual("3.14".toFloatValue, 3.14, accuracy: 0.000_001)
        XCTAssertEqual("nan".toFloatValue, 0.0, accuracy: 0.000_001) // fallback 0
    }

    func testString_toDouble_optional_and_value() {
        XCTAssertEqual("2.5".toOptionalDouble, 2.5)
        XCTAssertNil("two.five".toOptionalDouble)
        XCTAssertEqual("2.5".toDouble, 2.5, accuracy: 0.000_001)
        XCTAssertEqual("bad".toDouble, 0.0, accuracy: 0.000_001) // fallback 0
    }

    // MARK: - Date parsing (non-throwing)

    func testString_parseDate_optional_success() {
        let s = "2025-08-26 12:34:56"
        let d : Date? = s.parseDate()
        XCTAssertNotNil(d)
    }

    func testString_parseDate_optional_failure_returnsNil() {
        let s = "26-08-2025 12:34:56" // wrong order vs default format
        XCTAssertNil(s.parseDate())
    }

    // MARK: - Date -> String

    func testDate_toString_roundTrip() throws {
        // Build a stable Date from components (system tz/locale agnostic once both sides use same formatter)
        var comps = DateComponents()
        comps.year = 2025
        comps.month = 8
        comps.day = 26
        comps.hour = 12
        comps.minute = 34
        comps.second = 56
        comps.calendar = Calendar(identifier: .gregorian)
        // Use GMT to avoid surprises when constructing the Date
        comps.timeZone = TimeZone(secondsFromGMT: 0)

        let date = comps.date!
        let formatted = date.toString(format: "yyyy-MM-dd HH:mm:ss")

        // Compute expected using the same formatter config as the library function
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let expected = df.string(from: date)

        XCTAssertEqual(formatted, expected)
    }
}

// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

//MARK: - Numeric Conversions
public extension Numeric {
    /// Converts Numeric → String
    @inlinable
    var toString: String { String(describing: self) }
}

public extension Numeric where Self: BinaryInteger {
    /// Converts BinaryInteger → Int
    @inlinable
    var toInt: Int { Int(self) }
    
    /// Converts BinaryInteger → Float
    @inlinable
    var toFloat: Float { Float(self) }
    
    /// Converts BinaryInteger → Double
    @inlinable
    var toDouble: Double { Double(self) }
    
    /// Converts BinaryInteger → CGFloat
    @inlinable
    var toCGFloat: CGFloat { CGFloat(self) }
}

public extension Numeric where Self: BinaryFloatingPoint {
    /// Converts BinaryFloatingPoint → Int  (truncates decimals)
    @inlinable
    var toInt: Int { Int(self) }
    
    /// Converts BinaryFloatingPoint → Float
    @inlinable
    var toFloat: Float { Float(self) }
    
    /// Converts BinaryFloatingPoint → Double
    @inlinable
    var toDouble: Double { Double(self) }
    
    /// Converts BinaryFloatingPoint → CGFloat
    @inlinable
    var toCGFloat: CGFloat { CGFloat(self) }
}

// MARK: - String Conversions
public extension String {
    
    /// Converts String → Int? (returns nil if not valid integer)
    @inlinable
    var toInt: Int? {
        return Int(self)
    }
    
    /// Converts String → Int, returns 0 if parsing fails
    @inlinable
    var toIntValue: Int {
        return Int(self) ?? 0
    }
    
    /// Converts String → Float? (returns nil if not valid float)
    @inlinable
    var toFloat: Float? {
        return Float(self)
    }
    
    /// Converts String → Float, returns 0 if parsing fails
    @inlinable
    var toFloatValue: Float {
        guard let f = Float(self), !f.isNaN else {
            return 0
        }
        return f
    }
    
    /// Converts String → Double, returns 0 if parsing fails
    @inlinable
    var toDouble: Double {
        return Double(self) ?? 0
    }
    
    /// Converts String → Optional Double (nil if invalid)
    @inlinable
    var toOptionalDouble: Double? {
        return Double(self)
    }
    
    /// Parses String → Date? with given format (returns nil if parsing fails)
    @inlinable
    func parseDate(format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

// MARK: - Date Conversions
public extension Date {
    
    /// Converts Date → String with given format
    @inlinable
    func toString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

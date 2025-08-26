// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// MARK: - Int Conversions
public extension Int {
    
    /// Converts Int → Double
    @inlinable
    var toDouble: Double {
        return Double(self)
    }
    
    /// Converts Int → String
    @inlinable
    var toString: String {
        return String(self)
    }
    
    /// Converts Int → Float
    @inlinable
    var toFloat: Float {
        return Float(self)
    }
}

// MARK: - Double Conversions
public extension Double {
    
    /// Converts Double → Int (truncates decimals)
    @inlinable
    var toInt: Int {
        return Int(self)
    }
    
    /// Converts Double → String
    @inlinable
    var toString: String {
        return String(self)
    }
    
    /// Converts Double → Float (possible precision loss)
    @inlinable
    var toFloat: Float {
        return Float(self)
    }
}

// MARK: - Float Conversions
public extension Float {
    
    /// Converts Float → Int (truncates decimals)
    @inlinable
    var toInt: Int {
        return Int(self)
    }
    
    /// Converts Float → String
    @inlinable
    var toString: String {
        return String(self)
    }
    
    /// Converts Float → Double
    @inlinable
    var toDouble: Double {
        return Double(self)
    }
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

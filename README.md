# ConvertibleUtils

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20iPadOS-blue.svg)]()
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](LICENSE)

A lightweight Swift package providing handy **type conversion utilities** for `Int`, `Double`, `Float`, `String`, and `Date`.  
Designed for iOS and iPadOS using Swift Package Manager.

---

## ✨ Features

- 🔄 Simple one-liner conversions:
  - `Int` ↔ `Double` ↔ `Float` ↔ `String`
- 📆 String ↔ Date parsing & formatting
  - Optional (`Date?`) and throwing (`throws`) APIs
- ⚡ Optimized with `@inlinable` for cross-module performance
- 📦 Distributed as a Swift Package (SPM)

---

## 📦 Installation

### Xcode (Recommended)

1. Open your project in Xcode.  
2. Go to **File → Add Packages…**  
3. Enter the repo URL:

   ```
   https://github.com/<your-username>/ConvertibleUtils.git
   ```

4. Choose **Dependency Rule** → “Up to Next Major” from `1.0.0`.  
5. Select the target you want to add the package to.

### Swift Package Manager (`Package.swift`)

```swift
dependencies: [
    .package(url: "https://github.com/<your-username>/ConvertibleUtils.git", from: "1.0.0")
],
targets: [
    .target(
        name: "MyApp",
        dependencies: [
            .product(name: "ConvertibleUtils", package: "ConvertibleUtils")
        ]
    )
]
```

---

## 🚀 Usage

```swift
import ConvertibleUtils

// MARK: - Number Conversions
let n: Int = 42
print(n.toDouble)   // 42.0
print(n.toString)   // "42"
print(n.toFloat)    // 42.0

let d: Double = 3.14
print(d.toInt)      // 3
print(d.toString)   // "3.14"
print(d.toFloat)    // 3.14

let f: Float = 12.75
print(f.toInt)      // 12
print(f.toString)   // "12.75"
print(f.toDouble)   // 12.75

// MARK: - String Conversions
print("123".toInt)         // Optional(123)
print("abc".toIntValue)    // 0
print("3.14".toDouble)     // 3.14
print("nan".toFloatValue)  // 0.0 (safe fallback)

// MARK: - Date Parsing
let dateStr = "2025-08-26 12:34:56"
let parsed = dateStr.parseDate()            // Date?
let parsedThrow = try? dateStr.parseDate()  // throws on failure

// MARK: - Date Formatting
let now = Date()
print(now.toString())                      // "2025-08-26 12:34:56"
print(now.toString(format: "yyyy/MM/dd"))  // "2025/08/26"
```

---

## 🧪 Tests

All functions are covered with **XCTest**.  
Run the test suite:

```bash
swift test
```

Sample test:

```swift
func testInt_toDouble() {
    XCTAssertEqual(42.toDouble, 42.0, accuracy: 0.0001)
}
```

---

## 📄 License

`ConvertibleUtils` is available under the MIT license.  
See [LICENSE](LICENSE) for details.

---

## 🤝 Contributing

Pull requests are welcome!  
- For major changes, open an issue first to discuss your idea.  
- Make sure tests pass (`swift test`) before submitting.  
- Please update documentation/README where appropriate.

---

## 📌 Roadmap

- [ ] Add support for `Decimal` conversions  
- [ ] Locale-aware number parsing/formatting  
- [ ] More robust date parsing (multiple formats, ISO8601, RFC3339)  
- [ ] Additional math & string helpers  

---

## 💡 Example Apps

Coming soon — demo iOS project using `ConvertibleUtils`.

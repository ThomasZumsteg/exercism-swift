import Foundation

typealias grainsReturn = (result: UInt64, error: String?)

func ==(lhs: grainsReturn, rhs: grainsReturn) -> Bool {
    let sameResults:Bool = lhs.result == rhs.result
    let sameError = lhs.error == rhs.error
    return sameResults && sameError
}

class Grains {
    static func square(n: Int) -> grainsReturn {
        guard 0 < n && n <= 64 else {
            return (result: 0, error: "Input[\(n)] invalid. Input should be between 1 and 64 (inclusive)")
        }
        return (result: UInt64(pow(2.0, Double(n-1))), error: nil)
    }
    
//    static let total: UInt64 = UInt64(pow(2.0, 65.0)) - 1
    static let total: UInt64 = UInt64.max
}
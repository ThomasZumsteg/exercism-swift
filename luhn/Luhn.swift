import Foundation

class Luhn {
    let code: Int
    
    init(_ code: Int) { self.code = code }
    
    var addends: [Int] {
        get {
            var odd = false
            var ends = [Int]()
            let digits: [Int] = String(code)
                .characters
                .reverse()
                .map{Int(String($0))!}
            for var n in digits {
                if odd { n *= 2 }
                if 10 <= n { n -= 9 }
                odd = !odd
                ends.insert(n, atIndex: 0)
            }
            return ends
        }
    }
    
    var checksum: Int {
        get {
            return addends.reduce(0, combine: +)
        }
    }
    
    var isValid: Bool {
        get {
            return 0 == (checksum % 10)
        }
    }
    
    static func create(base: Int) -> Int {
        let baseLuhn: Luhn = Luhn(base * 10)
        if baseLuhn.checksum % 10 == 0 { return baseLuhn.code }
        else {
            return baseLuhn.code + 10 - (baseLuhn.checksum % 10)
        }
    }
}
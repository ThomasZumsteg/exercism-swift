import Foundation

class PhoneNumber {
    var digits: [Character]
    let numbers = NSCharacterSet.decimalDigitCharacterSet()
    
    init (_ startingNumber: String) {
        let utfDigits = startingNumber.utf16.filter(numbers.characterIsMember)
        digits = utfDigits.map{Character(UnicodeScalar($0))}
        
        if (digits.count == 11) && (digits[0] == "1") {
            digits.removeAtIndex(0)
        } else if (digits.count != 10) {
            digits = [Character](count:10, repeatedValue: "0")
        }
    }
    
    var number: String {
        get {
            return String(digits)
        }
    }
    
    var areaCode: String {
        get {
            return String(digits[0..<3])
        }
    }
    
    private func toString() -> String {
        let areaCode = self.areaCode
        let prefix = String(digits[3..<6])
        let lineNum = String(digits[6..<10])
        
        return "(\(areaCode)) \(prefix)-\(lineNum)"
    }
    
}

extension String {
    init(_ phonenumber: PhoneNumber) {
            self.init(phonenumber.toString())
    }
}
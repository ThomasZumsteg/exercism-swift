import Foundation

class PhoneNumber {
    var digits: [Character]
    let numbers = NSCharacterSet.decimalDigitCharacterSet()
    
    init (startingNumber: String) {
        let utfDigits = startingNumber.utf16.filter(numbers.characterIsMember)
        digits = utfDigits.map{Character(UnicodeScalar($0))}
        
        if (digits.count == 11) && (digits[0] == "1") {
            digits.removeAtIndex(0)
        } else if (digits.count != 10) {
            digits = [Character](count:10, repeatedValue: "0")
        }
    }
    
    func number() -> String {
        return String(digits)
    }
    
    func areaCode() -> String {
        return String(digits[0..<3])
    }
    
    func description() -> String {
        let areaCode = self.areaCode()
        let prefix = String(digits[3..<6])
        let lineNum = String(digits[6..<10])
        
        return "(\(areaCode)) \(prefix)-\(lineNum)"
    }
    
}
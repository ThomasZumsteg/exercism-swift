import Foundation

class Atbash {
    static func encode(clearText: String) -> String {
        return clearText
            .lowercaseString
            .characters
            .map{ invert($0) }
            .filter{ $0 != nil }
            .map{ $0! }
            .groupBy(5)
            .map{String($0)}
            .joinWithSeparator(" ")
    }
        
    private static func invert(c: Character) -> Character? {
        let lower = NSCharacterSet.lowercaseLetterCharacterSet()
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        let charUtf16 = String(c).utf16.first!
        
        switch true {
        case lower.characterIsMember(charUtf16):
            return Character(UnicodeScalar(219 - charUtf16))
        case digits.characterIsMember(charUtf16):
            return c
        default:
            return nil
        }
    }
}

extension Array {
    func groupBy(n: Int) -> [[Element]] {
        var new = [[Element]]()
        
        for var i = self.startIndex; i < self.endIndex; i = i.advancedBy(n) {
            let end = i.advancedBy(n, limit: self.endIndex)
            new.append(Array(self[i..<end]))
        }
        return new
    }
}

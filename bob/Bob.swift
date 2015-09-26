import Foundation

class Bob {
    static let whiteSpace = NSCharacterSet.whitespaceAndNewlineCharacterSet()
    static let upperCase = NSCharacterSet.uppercaseLetterCharacterSet()
    static let lowerCase = NSCharacterSet.lowercaseLetterCharacterSet()
    
    static func hey(phrase:String) -> String {
        let trimPhrase = phrase.stringByTrimmingCharactersInSet(whiteSpace)
        switch true {
        case trimPhrase == "":
            return "Fine, be that way."
        case any(trimPhrase, of: upperCase) && !any(trimPhrase, of: lowerCase):
            return "Woah, chill out!"
        case trimPhrase.substringFromIndex(trimPhrase.endIndex.predecessor()) == "?":
            return "Sure."
        default: return "Whatever."
        }
    }
    
    private static func any(s:String, of set:NSCharacterSet) -> Bool {
        for c in s.utf16 {
            if set.characterIsMember(c) { return true }
        }
        return false
    }
}
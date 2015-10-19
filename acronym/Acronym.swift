import Foundation

class Acronym {
    
    static func abbreviate(text: String) -> String {
        return text
            .characters
            .split{Acronym.splitFunc($0)}
            .map(ackWord)
            .joinWithSeparator("")
    }
    
    private static func splitFunc(c: Character) -> Bool {
        let splitCharacterSet = NSMutableCharacterSet()
        splitCharacterSet.formUnionWithCharacterSet(NSCharacterSet.whitespaceCharacterSet())
        splitCharacterSet.formUnionWithCharacterSet(NSCharacterSet.punctuationCharacterSet())
        return splitCharacterSet
            .characterIsMember(String(c).utf16.first!)
    }
    
    private static func ackWord(word: String.CharacterView) -> String {
        let upperFromWord = word.filter{
            NSCharacterSet.uppercaseLetterCharacterSet()
                .characterIsMember(String($0).utf16.first!)
        }
        
        switch true {
        case 1 < upperFromWord.count && upperFromWord != Array(word):
            return String(upperFromWord)
        default:
            return String(word.first!).uppercaseString
        }
    }
}
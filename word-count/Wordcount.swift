import Foundation

class WordCount {
    var sentance: String
    
    init(words: String) {
        sentance = words
    }
    
    func count() -> [String: Int] {
        var wordCount = [String:Int]()
        let spaces = NSCharacterSet.whitespaceCharacterSet()
        let allowedChars = NSMutableCharacterSet()
        allowedChars.formUnionWithCharacterSet(NSCharacterSet.letterCharacterSet())
        allowedChars.formUnionWithCharacterSet(NSCharacterSet.decimalDigitCharacterSet())
        
        allowedChars.formUnionWithCharacterSet(spaces)
        
        let words = sentance.lowercaseString.utf16
            .filter{allowedChars.characterIsMember($0)}
            .split{spaces.characterIsMember($0)}
    
        for w in words {
            let word = String(w.map{Character(UnicodeScalar($0))})
            wordCount[word] = (wordCount[word] ?? 0) + 1
        }
        return wordCount
    }
}
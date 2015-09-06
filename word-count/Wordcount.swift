import Foundation

class WordCount {
    var words: String
    
    init(words: String) {
        self.words = words
    }
    
    func count() -> [String: Int] {
        var wordCount = [String:Int]()
        
        var wordSting = self.words.lowercaseString.characters.filter(isAlphaNum)
        let words = split(wordSting){$0 == " "}.map{String($0)}
        
        for word in words {
            if let n = wordCount[word] {
                wordCount[word] = n + 1
            } else {
                wordCount[word] = 1
            }
        }
        return wordCount
    }
    
    func isAlphaNum(c:Character) -> Bool {
        let alphaNum = Set("abcdefghijklmnopqrstuvwxyz0123456789 ".characters)
        return alphaNum.isSupersetOf(Set([c]))
    }
}
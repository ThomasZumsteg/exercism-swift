import Foundation

class Anagram {
    let word: String
    
    init(word: String) {
        self.word = word
    }
    
    func match(words: [String]) -> [String] {
        let letters = self.word.lowercaseString.characters.sort()
        var anagrams = [String]()
        for w in words {
            let sameLetters = w.lowercaseString.characters.sort() == letters
            let sameWord = w.lowercaseString == word.lowercaseString
            if sameLetters && !sameWord {
                anagrams.append(w)
            }
        }
        return anagrams
    }
}
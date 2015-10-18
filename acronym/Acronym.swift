import Foundation

class Acronym {
    static func abbreviate(text: String) -> String {
        return text
            .characters
            .split(" ")
            .map(ackWord)
            .joinWithSeparator("")
    }
    
    private static func ackWord(word: String.CharacterView) -> String {
        
        switch true {
        
        default:
            return String(word.first!).uppercaseString
        }
    }
}
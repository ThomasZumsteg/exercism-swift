import Foundation

class PigLatin {
    static func translate(phrase: String) -> String {
        return phrase
            .characters
            .split{ $0 == " " }
            .map{translateWord(String($0))}
            .joinWithSeparator(" ")
    }
    
    private static func translateWord(word: String) -> String {
        let patterns = [
            "^(.*?[^q])(u.*)", // U is first vowel, but not qu
            "^(.*?y[^aeiou].*)()$", // Y is first vowel
            "^(.*?)([aeio].*)$", // Base case
        ]
        let wholeWord: NSRange = NSMakeRange(0, word.characters.count)
        for pattern in patterns {
            let pigRegex = try! NSRegularExpression(pattern: pattern, options: [])
            let match = pigRegex.matchesInString(word, options: [], range: wholeWord)
            
            guard match.count > 0 else { continue }
            
            let pre: String = (word as NSString).substringWithRange(match[0].rangeAtIndex(1))
            let post: String = (word as NSString).substringWithRange(match[0].rangeAtIndex(2))
            
            // Cases like ayxray
            if post != "ay" { return post + pre + "ay" }
        }
        
//        Default case
        return word + "ay"
    }
}
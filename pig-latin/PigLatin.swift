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
        let patterns = ["^(.*?[^q])(u.*)", "^(y[^aeiou].*)()$", "^(.*?)([aeoi].*)$", "^(.*)()$"]
        var pre: String = ""
        var post: String = ""
        for pattern in patterns {
            let pigRegex = try! NSRegularExpression(pattern: pattern, options: [])
            let match = pigRegex.matchesInString(word, options: [], range: NSMakeRange(0, word.characters.count))
            
            guard match.count > 0 else {continue }
            
            pre = (word as NSString).substringWithRange(match[0].rangeAtIndex(1))
            post = (word as NSString).substringWithRange(match[0].rangeAtIndex(2))
            
            if pre + "ay" != word { break }
        }
        return post + pre + "ay"
    }
}
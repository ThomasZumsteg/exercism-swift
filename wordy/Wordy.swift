import Foundation

class WordProblem {
    let phrase: String
    let operations: [String: (Int, Int) -> Int] = [
        "minus": { $0 - $1 },
        "plus": { $0 + $1 },
        "multiplied by": { $0 * $1 },
        "divided by": { $0 / $1 },
    ]
    
    init(_ phrase: String) {
        self.phrase = phrase
    }
    
    func answer() throws -> Int {
        guard phrase.hasPrefix("What is ") else { throw answerError.error }
        // Get the first digit
        
        
        let stepRegexp = try! NSRegularExpression(" (plus|minus|multiplied by|divided by) (-?\\d+)", options: [])
        // for a receding range, while there's a match,
        // process the match
            let num: Int = Int()
            let op: String = (phrase as NSString).substringWithRange(match[0].rangeAtIndex(1))
        // update the result
        
        // check that the remaining character is a "?"
        // return result
    }
}

enum answerError: ErrorType {
    case error
}
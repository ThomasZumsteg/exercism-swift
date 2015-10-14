import Foundation

class WordProblem {
    let phrase: String
    
    init(_ phrase: String) {
        self.phrase = phrase
    }
    
    func answer() throws -> Int {
        let pattern: String = "(^What is| plus| minus| multiplied by| divided by) (-?\\d+)"
        let stepRegexp = try! NSRegularExpression(pattern: pattern, options: [])
        let wholePhrase: NSRange = NSMakeRange(0, phrase.characters.count)
        let step = stepRegexp.matchesInString(phrase, options: [], range: wholePhrase)
        guard step.count >= 2 &&
            (phrase as NSString).substringWithRange(step[0].rangeAtIndex(1)) == "What is"
            else { throw answerError.error }
        var result: Int = 0
        for s in 0..<step.count {
            let op = (phrase as NSString).substringWithRange(step[s].rangeAtIndex(1))
            let num = (phrase as NSString).substringWithRange(step[s].rangeAtIndex(2))
            if let n = Int(num) {
                result = try stepFunc(result, op: op, num: n)
            }
        }
        return result
    }
    
    private func stepFunc(inital: Int, op: String, num: Int) throws -> Int {
        switch op {
        case "What is": return num
        case " plus": return inital + num
        case " minus": return inital - num
        case " multiplied by": return inital * num
        case " divided by": return inital / num
        default: throw answerError.error
        }
    }
}

enum answerError: ErrorType {
    case error
}
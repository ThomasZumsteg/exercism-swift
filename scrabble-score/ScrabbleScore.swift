import Foundation

class Scrabble {
    var score: Int
    
    init(_ letters: String?) {
        score = Scrabble.score(letters)
    }
    
    static func score(word: String?) -> Int {
        let values: [Character: Int]! = [
            "A": 1, "E": 1, "I": 1, "O": 1, "U": 1,
            "L": 1, "N": 1, "R": 1, "S": 1, "T": 1,
            "D": 2, "G": 2,
            "B": 3, "C": 3, "M": 3, "P": 3,
            "F": 4, "H": 4, "V": 4, "W": 4, "Y": 4,
            "K": 5,
            "J": 8, "X": 8,
            "Q":10, "Z":10,
        ]

        if let letters = word {
            return letters
                .uppercaseString
                .characters
                .map{values[$0] ?? 0}
                .reduce(0, combine: +)
        } else {
            return 0
        }
    }
}
import Foundation

class Hamming {
    class func compute(ref: String, against: String) -> Int? {
        
        if ref.characters.count != against.characters.count { return nil }
        
        var count = 0
        for (char_a, char_b) in zip(ref.characters, against.characters) {
            if char_a != char_b {
                count++
            }
        }
        return count
    }
}
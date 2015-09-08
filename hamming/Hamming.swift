import Foundation

class Hamming {
    class func compute(ref: String, against: String) -> Int? {
        
        let refChars = ref.characters
        let againstChars = against.characters
        
        guard (refChars.count == againstChars.count) else { return nil }
        
        let diffs = zip(refChars, againstChars).map{$0 != $1 ? 1 : 0}
        return diffs.reduce(0, combine: +)
    }
}
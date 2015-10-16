import Foundation

class Cipher {
    var key: String = "aaaaaaaaaaa"
    
    init() { }
    
    init?(key: String) {
        let letters = NSCharacterSet(charactersInString: key)
        let allLowercase: Bool = NSCharacterSet
            .lowercaseLetterCharacterSet()
            .isSupersetOfSet(letters)
        let hasLetters: Bool = 0 < key.characters.count
        guard hasLetters && allLowercase else { return nil }
        self.key = key
    }
    
    func encode(text: String) -> String {
        let a = Int("a".utf16.first!)
        return shift(text){ ($0 + $1 - 2 * a ) % 26 + a }

    }
    
    func decode(text: String) -> String {
        let a = Int("a".utf16.first!)
        return shift(text){ ($0 - $1) % 26 + a }
    }
    
    private func shift(text: String, _ shiftFunc: (Int, Int) -> Int) -> String {
        var shifted = [Int]()
        let unshifted: [Int] = text.utf16.map(Int.init)
        var shiftDistance: [Int] = key.utf16.map(Int.init)
        while shiftDistance.count < unshifted.count {
            shiftDistance.appendContentsOf(key.utf16.map(Int.init))
        }
        for (u, d) in zip(unshifted, shiftDistance) {
            shifted.append(shiftFunc(u, d))
        }
        return String(shifted.map{Character(UnicodeScalar($0))})
    }
}
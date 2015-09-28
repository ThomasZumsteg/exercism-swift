import Foundation

class Crypto {
    let text: String
    let allowedChars = NSMutableCharacterSet()

    init(_ text: String) {
        self.text = text
        allowedChars.formUnionWithCharacterSet(NSCharacterSet.letterCharacterSet())
        allowedChars.formUnionWithCharacterSet(NSCharacterSet.decimalDigitCharacterSet())
    }
    
    var normalizePlaintext: String {
        get {
            return String(text.lowercaseString.utf16
                .filter{allowedChars.characterIsMember($0)}
                .map{Character(UnicodeScalar($0))})
        }
    }
    
    var size: Int {
        get {
            return Int(ceil(sqrt(Double(normalizePlaintext.characters.count))))
        }
    }
    
    var plaintextSegments: [String] {
        get {
            let length = normalizePlaintext.characters.count
            let start = normalizePlaintext.startIndex
            return 0
                .stride(to: length, by: size)
                .map{normalizePlaintext[
                    start.advancedBy($0)..<start.advancedBy($0 + size,
                    limit: normalizePlaintext.endIndex)]}
        }
    }
    
    var ciphertext: String {
        get {
            var cipherText: String = ""
            for col in 0..<size {
                for row in 0..<plaintextSegments.count {
                    let word = plaintextSegments[row]
                    if col < word.characters.count {
                        cipherText += String(word[word.startIndex.advancedBy(col)])
                    }
                }
            }
            return cipherText
        }
    }
    
    var normalizeCiphertext: String {
        get {
            var text = ""
            let start = ciphertext.startIndex
            for i in 0.stride(to: ciphertext.characters.count, by: size - 1) {
                text += ciphertext[start.advancedBy(i)..<start.advancedBy(i + size - 1, limit: ciphertext.endIndex)] + " "
            }
            return text[text.startIndex..<text.endIndex.predecessor()]
        }
    }
}
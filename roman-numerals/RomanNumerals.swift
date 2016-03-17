import Foundation

class RomanNumeral {
    var decimal: Int
    let romanDigits: [(Int, String)] = [
        (   1, "I"), (  4, "IV"), (  5, "V"), (  9, "IX"),
        (  10, "X"), ( 40, "XL"), ( 50, "L"), ( 90, "XC"),
        ( 100, "C"), (400, "CD"), (500, "D"), (900, "CM"),
        (1000, "M"),]

    init(_ decimal: Int) {
        self.decimal = decimal
    }
    
    private func toString() -> String {
        var remainer = self.decimal
        var roman = ""
        for (value, digit) in romanDigits.reverse() {
            while value <= remainer {
                roman += digit
                remainer -= value
            }
        }
        return roman
    }
}

extension String {
    init(_ roman: RomanNumeral) {
        self.init(roman.toString())
    }
}

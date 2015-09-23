import Foundation

class Binary {
    var toDecimal: Int = 0
    
    init?(_ bin:String) {
        for c in bin.characters {
            switch c {
            case Character("0"): toDecimal *= 2
            case Character("1"): toDecimal = toDecimal * 2 + 1
            default: return nil
            }
        }
    }
}
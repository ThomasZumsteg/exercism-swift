import Foundation

class Binary {
    var toDecimal: Int = 0
    
    init?(_ bin:String) {
        for c in bin.characters {
            toDecimal *= 2
            switch c {
            case Character("0"): break
            case Character("1"): toDecimal++
            default: return nil
            }
        }
    }
}
import Foundation

class Trinary {
    let num: String
    
    init(_ n: String) { num = n }
    
    var toDecimal: Int {
        get {
            var decimal: Int = 0
            for d in num.characters.map({Int(String($0))}) {
                if d == nil || d < 0 || 2 < d { return 0 }
                decimal = decimal * 3 + d!
            }
            return decimal
        }
    }
}
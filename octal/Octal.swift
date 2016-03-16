import Foundation

class Octal {
    let oct: String
    
    init(_ oct: String) {
        self.oct = oct
    }
    
    var toDecimal: Int {
        get {
            var decimal: Int = 0
            for n in oct.characters.map({Int(String($0))}) {
                guard n != nil && n! < 8 else { return 0 }
                decimal = decimal * 8 + n!
            }
            return decimal
        }
    }
}

extension Int {
    init(_ oct: Octal) {
        self.init(oct.toDecimal)
    }
}
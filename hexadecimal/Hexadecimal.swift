/*Hexadecimal is a base 16 number*/
class Hexadecimal {
    let hex: String
    private let digits = Array("0123456789abcdef".characters)
    
    init(_ hex: String) {
        self.hex = hex
    }
}

extension Int {
    /*init? converts a hexadecimal number to a base 10 number*/
    init?(_ hex: Hexadecimal) {
        var total: Int = 0
        for c in hex.hex.characters {
            total = total << 4
            if let i = hex.digits.indexOf(c) {
                total = total | i
            } else {
                return nil
            }
        }
        self.init(total)
    }
}
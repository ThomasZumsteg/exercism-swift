import Foundation

infix operator ** { }
func ** (base: Int, power: Int) -> Int {
    return Int(pow(Double(base), Double(power)))
}

class Squares {
    let num: Int
    
    init(_ num: Int) {
        self.num = num
    }
    
    var squareOfSums: Int {
        get {
            return (num ** 2) * ((num + 1) ** 2) / 4
        }
    }
    
    var sumOfSquares: Int {
        get {
            return num * (num + 1) * (2 * num + 1) / 6
        }
    }
    
    var differenceOfSquares: Int {
        get {
            return squareOfSums - sumOfSquares
        }
    }
}
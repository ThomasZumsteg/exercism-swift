import Foundation

class PrimeFactors {
    static func For(num:Int) -> [Int] {
        var remainer: Int = num
        var factors: [Int] = [Int]()
        for f in 2.stride(through: Int(sqrt(Double(num))), by: 1) {
            if remainer == 1 { break }
            while remainer % f == 0 {
                factors.append(f)
                remainer /= f
            }
        }
        if remainer > 1 { factors.append(remainer) }
        return factors
    }
}
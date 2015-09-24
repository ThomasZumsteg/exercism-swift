import Foundation

class PrimeFactors {
    static func For(num:Int, var _ factor:Int = 2) -> [Int] {
        if num == 1 { return [] }
        while (num % factor) != 0 { factor++ }
        return [factor] + For(num / factor, factor)
    }
}
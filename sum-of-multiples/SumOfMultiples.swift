import Foundation

class SumOfMultiples {
    static func toLimit(limit: Int, inMultiples: [Int] = [3,5]) -> Int {
        return Array(1..<limit)
            .filter(hasMultiples(inMultiples))
            .reduce(0, combine: +)
    }
}

func hasMultiples(factors: [Int]) -> (Int -> Bool) {
    return { (n) in
        for f in factors.filter({$0 != 0}) {
            if n % f == 0 { return true }
        }
        return false
    }
}

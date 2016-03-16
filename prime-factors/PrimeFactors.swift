import Foundation

class PrimeFactors {
    let num: Int
    
    init(_ num: Int) {
        self.num = num
    }
    
    var toArray: [Int] {
        get {
            var factors = [Int]()
            var remainder = num
            var factor: Int = 2
            while( remainder > 1 ) {
                if( remainder % factor == 0) {
                    factors.append(factor)
                    remainder /= factor
                } else {
                    factor += 1
                }
            }
            return factors
        }
    }
}
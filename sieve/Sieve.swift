import Foundation

class Sieve {
    let limit: Int
    
    init(_ limit: Int) { self.limit = limit }
    
    var primes: [Int] {
        get {
            var sieve = [Bool](count: limit+1, repeatedValue: true)
            var primes = [Int]()
            for n in 2...limit {
                guard sieve[n] else { continue }
                primes.append(n)
                for m in (n*n).stride(through: limit, by: n) {
                    sieve[m] = false
                }
            }
            return primes
        }
    }
}
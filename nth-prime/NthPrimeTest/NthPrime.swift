import Foundation

class Prime {
    static func nth(n: Int) -> Int? {
        if n <= 0 {
            return nil
        }
        var primes = [2,3,5,7,11,13]
        for var num = primes.last! + 2; primes.count < n; num += 2 {
            for p in primes {
                if num % p == 0 {
                    break
                } else if num < p * p {
                    primes.append(num)
                    break
                }
            }
        }
        return primes[n-1]
    }
}
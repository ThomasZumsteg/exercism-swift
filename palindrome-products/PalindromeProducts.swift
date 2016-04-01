/*PalindromeProducts finds numbers that are palindromes*/
class PalindromeProducts {
    var palindromes = Set<Factor>()
    
    /*init finds all palindrome numbers in the given range*/
    init(maxFactor: Int, minFactor: Int = 1) {
        for n in minFactor...maxFactor {
            for m in n...maxFactor {
                let num = n * m
                if PalindromeProducts.isPalindrome(String(num)) {
                    palindromes.insert(Factor(value: num, factor: [n, m]))
                }
            }
        }
    }
    
    /*The largest and smallest palindromes in the range*/
    var largest: Factor { return palindromes.maxElement()! }
    var smallest: Factor { return palindromes.minElement()! }
    
    private static func isPalindrome(s: String) -> Bool {
        return Array(s.characters) == s.characters.reverse()
    }
}

/*Factor stores a value its factors*/
struct Factor: Hashable, Comparable {
    let value: Int
    let factor: [Int]
    var hashValue: Int { return value.hashValue }
}

/*== defines when Factors are equal*/
func ==(lhs: Factor, rhs: Factor) -> Bool {
    return lhs.value == rhs.value
}

/*< defines when one Factor is less than another*/
func <(lhs: Factor, rhs: Factor) -> Bool {
    return lhs.value < rhs.value
}
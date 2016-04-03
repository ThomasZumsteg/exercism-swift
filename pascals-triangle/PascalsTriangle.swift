
class PascalsTriangle {
    let rows: [[Int]]
    
    init(_ r: Int) {
        rows = (0..<r).map{ (n) -> [Int] in
            (0...n).map{ (k) -> Int in
                PascalsTriangle.binomial(n, k)
            }
        }
    }
    
    private static func binomial(n: Int, _ k: Int) -> Int {
        return fact(n) / (fact(k) * fact(n - k))
    }
    
    private static func fact(n: Int) -> Int {
        if n <= 0 { return 1 }
        return (1...n).reduce(1, combine: { $0 * $1 })
    }
}
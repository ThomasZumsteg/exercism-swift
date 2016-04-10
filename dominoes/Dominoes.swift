
typealias Dominoe = (Int, Int)

class Dominoes {
    let dominoes: [Dominoe]
    
    init(_ chain: [Dominoe]) {
        dominoes = chain
    }
    
    var chained: Bool {
        var pool = dominoes
        guard let root = pool.popLast() else {
            return false
        }
        
        var chain = [root]
        var openNum = root.1
        while !pool.isEmpty {
            guard let i = pool.indexOf({ $0.0 == openNum || $0.1 == openNum }) else {
                return false
            }
            let (first, second) = pool.removeAtIndex(i)
            if first == openNum {
                openNum = second
                chain.append((first, second))
            } else {
                openNum = first
                chain.append((second, first))
            }
        }
        return chain.first!.0 == chain.last!.1
    }
}

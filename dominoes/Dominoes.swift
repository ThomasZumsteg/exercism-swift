
class Dominoes {
    let dominoes: [Dominoe]
    
    init(_ chain: [(Int, Int)]) {
        dominoes = chain.map{Dominoe($0.0, $0.1)}
    }
    
    var chained: Bool {
        var queue = [([(Int, Int)](), [Dominoe](), Int)]
        
        while !queue.isEmpty {
            let (chain, pool, tail) = queue.popLast()!
            if pool.isEmpty && chain.first!.0 == chain.last!.1 {
                return true
            }
            
            for i in (0...pool.count) {
                if let match = pool[i].hasNum(tail) {
                    let newPool = pool[0..<i] + pool[i..<pool.count]
                    let newChain = chain + [match]
                    let newTail = match.1
                    queue.append((newTail, newPool, newTail))
                }
            }
            
        }
    }
}

class Dominoe {
    let left, right: Int
    
    init(_ left: Int, _ right: Int) {
        self.left = left
        self.right = right
    }
    
    func hasNum(num: Int) -> (Int, Int)? {
        switch num {
        case left: return (left, right)
        case right: return (right, left)
        default: return nil
        }
    }
}
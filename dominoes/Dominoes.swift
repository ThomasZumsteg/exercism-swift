
/*Domines simulates a dominoes game*/
class Dominoes {
    let dominoes: [Dominoe]
    
    init(_ chain: [(Int, Int)]) {
        dominoes = chain.map{Dominoe($0.0, $0.1)}
    }
    
    /*Chain is a chain of tiles*/
    typealias Chain = [(Int, Int)]
    
    /*DominueState is the iterative state used to search for possible chains*/
    typealias DominoeState = (chain: Chain, pool:[Dominoe], tail:Int)

    /*chained checks if there is a matched sequence of dominoes that usese all the avaiable tiles
     Uses an iteraive search of all possible chains*/
    var chained: Bool {
        var queue = dominoes.enumerate().map{
            (i, dominoe) -> DominoeState in (
                chain: [(dominoe.left, dominoe.right)],
                pool: Array(
                    dominoes.prefix(i) +
                    dominoes.suffixFrom(i + 1)),
                tail: dominoe.right)
        }
        
        while !queue.isEmpty {
            let (chain, pool, tail) = queue.popLast()!
            if pool.isEmpty && !chain.isEmpty &&
                chain.first!.0 == chain.last!.1 {
                return true
            }
            
            for i in (0..<pool.count) {
                if let match = pool[i].hasNum(tail) {
                    let newPool = pool.prefix(i) + pool.suffixFrom(i + 1)
                    let newChain = chain + [match]
                    let newTail = match.1
                    queue.append((newChain, Array(newPool), newTail))
                }
            }
            
        }
        return false
    }
}

/*Dominue represents a single tile*/
class Dominoe {
    let left, right: Int
    
    init(_ left: Int, _ right: Int) {
        self.left = left
        self.right = right
    }
    
    /*hasNum returns a tile with the matching side on the left if it exists*/
    func hasNum(num: Int) -> (Int, Int)? {
        switch num {
        case left: return (left, right)
        case right: return (right, left)
        default: return nil
        }
    }
}
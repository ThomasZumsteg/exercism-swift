import Foundation

class Triplet {
    let nums: [Int]
    
    init(_ a: Int, _ b: Int, _ c:Int) { nums = [a,b,c].sort() }
    
    var sum: Int {
        get { return nums.reduce(0, combine: +) }
    }
    
    var product: Int {
        get { return nums.reduce(1, combine: *) }
    }
    
    var isPythagorean: Bool {
        get {
            let squareNums = nums.map{pow(Double($0), 2.0)}
            return squareNums[0] + squareNums[1] == squareNums[2]
        }
    }
    
    static func Where(min: Int = 1, maxFactor max: Int, sum: Int? = nil) -> [Triplet] {
        var triplets: [Triplet] = []
        for i in min...max {
            for j in i...max {
                for k in j...max{
                    let t = Triplet(i,j,k)
                    if t.isPythagorean && (sum == nil || t.sum == sum) {
                        triplets.append(t)
                    }
                }
            }
        }
        return triplets
    }
}

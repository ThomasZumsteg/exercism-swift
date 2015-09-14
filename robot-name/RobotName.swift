import Foundation

let letters = Array(65...90).map{Character(UnicodeScalar($0))}
let numbers: [Int] = Array(0..<1000)

extension Array {
    func random() -> Element {
        let i = arc4random_uniform(UInt32(self.count))
        return self[Int(i)]
    }
}

class Robot {
    var name: String!
    static var namesInUse = Set<String>()
    
    init () {
        resetName()
    }
    
    func resetName() {
        let oldName = name
        repeat {
            let alph = "\(letters.random())\(letters.random())"
            let nums = String(format: "%03d", numbers.random())
            name = alph + nums
        } while Robot.namesInUse.contains(name)
        if oldName != nil { Robot.namesInUse.remove(oldName!) }
    }
}
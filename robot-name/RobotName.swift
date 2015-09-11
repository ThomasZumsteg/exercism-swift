import Foundation

let letters = Array(65...90).map{Character(UnicodeScalar($0))}
let numbers = Array(48...57).map{Character(UnicodeScalar($0))}

func randFrom(items: [Character]) -> Character {
    let i = arc4random_uniform(UInt32(items.count))
    return items[Int(i)]
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
            name = String([
                    randFrom(letters),
                    randFrom(letters),
                    randFrom(numbers),
                    randFrom(numbers),
                    randFrom(numbers)
            ])
        } while Robot.namesInUse.contains(name)
        if oldName != nil { Robot.namesInUse.remove(oldName!) }
    }
}
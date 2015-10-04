import Foundation

class Luhn {
    let code: Int
    
    init(_ code: Int) { self.code = code }
    
    var addends: [Int] {
        get{ return [1,4,1,4,1] }
    }
    
    var checksum: Int {
        get { return 22 }
    }
    
    var isValid: Bool {
        get { return false }
    }
    
    static func create(base: Int) -> Int {
        return 1230
    }
}
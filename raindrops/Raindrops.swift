import Foundation

class Raindrops {
    let pairs = [
        (3, "Pling"),
        (5, "Plang"),
        (7, "Plong"),
    ]
    let num: Int
    
    init(_ num: Int) {
        self.num = num
    }
    
    var sounds: String {
        get {
            let sound: String = pairs
                .map({(f, s) in self.num % f == 0 ? s : ""})
                .joinWithSeparator("")
            return sound == "" ? String(num) : sound
        }
    }
}
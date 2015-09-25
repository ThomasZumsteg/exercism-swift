import Foundation

class Raindrops {
    static let pairs = [
        (3, "Pling"),
        (5, "Plang"),
        (7, "Plong"),
    ]
    
    static func convert(num: Int) -> String {
        let sound: String = pairs
            .map({(f, s) in num % f == 0 ? s : ""})
            .joinWithSeparator("")
        return sound == "" ? String(num) : sound
    }
}
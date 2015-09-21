import Foundation

class Triangle {
    let kind: String
    
    init(_ sides: Double...) {
        let sortedSides = sides.sort()
        switch true {
        case sortedSides[0] <= 0, sortedSides[0] + sortedSides[1] <= sortedSides[2]:
            kind = "ErrorKind"
        case sortedSides[0] == sortedSides[2]:
            kind = "Equilateral"
        case sortedSides[0] == sortedSides[1], sortedSides[1] == sortedSides[2]:
            kind = "Isosceles"
        default:
            kind = "Scalene"
        }
    }
}
import Foundation

enum Plant {
    case Radishes, Clover, Grass, Violets
}

class Garden {
    var garden: [[Plant]]
    var children: [String] = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet",
        "Ileana", "Joseph", "Kincaid", "Larry" ]
    private static let toPlant: [Character: Plant] = [
        "R": .Radishes,
        "C": .Clover,
        "G": .Grass,
        "V": .Violets
    ]
    
    init(_ garden: String, children: [String]? = nil) {
        if children != nil {
            self.children = children!.sort()
        }
        self.garden = garden
            .characters
            .split{ $0 == "\n" }
            .map{Array($0)
                .map{Garden.toPlant[$0]!}
        }
    }
    
    func plantsForChild(child: String) -> [Plant] {
        guard let i = children.indexOf(child) else {
            return []
        }
        var studentGarden: [Plant] = []
        for row in garden {
            studentGarden.append(row[2*i])
            studentGarden.append(row[2*i + 1])
        }
        return studentGarden
    }
}
/*Queens simulates two queens on a chess board*/
class Queens {
    var white, black: [Int]
    enum InitError: ErrorType {
        case IncorrectNumberOfCoordinates, InvalidCoordinates, SameSpace
    }
    
    /*init creates the two queen and checks for valid positions*/
    init(white: [Int] = [0,3], black: [Int] = [7,3]) throws {
        self.white = white
        self.black = black
        if( white.count != 2 || black.count != 2) {
            throw Queens.InitError.IncorrectNumberOfCoordinates
        } else if(max(white[0], white[1], black[0], black[1]) > 7 ||
            min(white[0], white[1], black[0], black[1]) < 0) {
            throw Queens.InitError.InvalidCoordinates
        } else if( white == black) {
            throw Queens.InitError.SameSpace
        }
    }
    
    /*description displays the board and position of the queens*/
    var description: String {
        var board: [String] = []
        for r in 0..<8 {
            var row: [String] = []
            for c in 0..<8 {
                switch true {
                case [r, c] == white: row.append("W")
                case [r, c] == black: row.append("B")
                default: row.append("_")
                }
            }
            board.append(row.joinWithSeparator(" "))
        }
        return board.joinWithSeparator("\n")
    }
    
    /*canAttack checks if the queens can attack eachother*/
    var canAttack: Bool {
        let sameRow = white[0] == black[0]
        let sameCol = white[1] == black[1]
        let diagonal = abs(white[0] - black[0]) == abs(white[1] - black[1])
        return sameRow || sameCol || diagonal
    }
}
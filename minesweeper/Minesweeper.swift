class Board {
    private var board: [[Character]] = []
    private var lineLength, boardLength: Int
    
    /*Errors while creating a minefield*/
    enum Error: ErrorType {
        case DifferentLength, FaultyBorder, InvalidCharacter
    }
    
    /*init create a minefield */
    init(_ lines: [String]) throws {
        boardLength = lines.count
        lineLength = lines[0].characters.count

        for (lineIndex, line) in lines.enumerate() {
            if line.characters.count != lineLength {
                throw Error.DifferentLength
            }
            for (charIndex, char) in line.characters.enumerate() {
                try vaildateCharacter(char, charIndex, lineIndex)
            }
            board.append(Array(line.characters))
        }
    }
    
    /*transform marks how many mines are adjacent to each square*/
    func transform() -> [String] {
        var marked: [String] = []
        for (l, line) in board.enumerate() {
            var row: [String] = []
            for (c, char) in line.enumerate() {
                if l == 0 || l == boardLength - 1 ||
                   c == 0 || c == lineLength - 1  ||
                   char == "*" {
                    row.append(String(char))
                } else {
                    row.append(countMines(l, c))
                }
            }
            marked.append(row.joinWithSeparator(""))
        }
        return marked
    }
    
    /*countMines counts the number of mines adjacent to a square*/
    private func countMines(row: Int, _ col: Int) -> String {
        let neighbors: [Character] = [
            board[row-1][col-1], board[row-1][col], board[row-1][col+1],
            board[row][col-1], board[row][col+1],
            board[row+1][col-1], board[row+1][col], board[row+1][col+1]
        ]
        var total = 0
        for elem in neighbors {
            if elem == "*" {
                total++
            }
        }
        
        if total == 0 {
            return " "
        } else {
            return String(total)
        }
    }
    
    /*validateCharacter checks that the character is allowed*/
    private func vaildateCharacter(char: Character, _ colIndex: Int, _ rowIndex: Int) throws {

        let topBottom = (rowIndex == 0) || (rowIndex == boardLength - 1)
        let leftRight = (colIndex == 0) || (colIndex == lineLength - 1)
        switch (topBottom, leftRight) {
        case (true, true):
            if char != "+" {
                throw Error.FaultyBorder
            }
        case (true, false):
            if char != "-" {
                throw Error.FaultyBorder
            }
        case (false, true):
            if char != "|" {
                throw Error.FaultyBorder
            }
        default:
            if char != " " && char != "*" {
                throw Error.InvalidCharacter
            }
        }
    }
}
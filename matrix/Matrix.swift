import Foundation

/*Matrix is a 2D matrix*/
class Matrix {
    var matrix = [[Int]]()
    init(_ matrixString: String) {
        for line in matrixString.componentsSeparatedByString("\n") {
            matrix.append(
                line.stringByTrimmingCharactersInSet(
                    NSCharacterSet.whitespaceAndNewlineCharacterSet()
                ).componentsSeparatedByString(" ")
                .map{ Int($0)! }
            )
        }
    }
    
    /*columns get the columsn in the matrix*/
    var columns: [[Int]] {
        var cols = [[Int]]()
        for var c = 0; c < rows[0].count; c++ {
            var col = [Int]()
            for var r = 0; r < rows.count; r++ {
                col.append(rows[r][c])
            }
            cols.append(col)
        }
        return cols
    }
    
    /*rows get the rows of the matrix*/
    var rows: [[Int]] {
        return matrix
    }
}
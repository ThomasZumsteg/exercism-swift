import Foundation

/*SaddlePointsMatrx finds the points that are a minimum in their column and a maximum in their row*/
class SaddlePointsMatrix {
    private var matrix: [[Int]] = []
    
    /*init parses the input into a 2D integer matrix*/
    init(_ input: String) {
        for line in input.componentsSeparatedByString("\n") {
            matrix.append(
                line.stringByTrimmingCharactersInSet(
                    NSCharacterSet.whitespaceAndNewlineCharacterSet()
                ).componentsSeparatedByString(" ")
                    .map{Int($0)!}
            )
        }
    }
    
    /*rows selects a row from the matrix*/
    var rows:[[Int]] {
        return matrix
    }
    
    /*columns selects a colum from the matrix*/
    var columns:[[Int]] {
        var cols:[[Int]] = []
        for col in (0..<matrix[0].count) {
            var line:[Int] = []
            for row in (0..<matrix.count) {
                line.append(matrix[row][col])
            }
            cols.append(line)
        }
        return cols
    }
    
    /*saddlePoints are all points that are a minimum in their column and a maxium in their row*/
    var saddlePoints: [[Int]] {
        var saddlePoints: [[Int]] = []
        for r in (0..<matrix.count) {
            for c in (0..<matrix[0].count) {
                let element = matrix[r][c]
                let biggest = rows[r].maxElement()!
                let smallest = columns[c].minElement()!
                if element == biggest && element == smallest {
                    saddlePoints.append([r,c])
                }
            }
        }
        return saddlePoints
    }
}
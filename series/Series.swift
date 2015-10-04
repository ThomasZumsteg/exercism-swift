import Foundation

class Series {
    let digits: String
    
    init(_ digits: String) {
        self.digits = digits
    }
    
    func slices(size: Int) -> [[Int]] {
        let len = digits.characters.count
        guard len >= size else { return [] }
        let start = digits.startIndex
        var sliceList = [[Int]]()
        for advance in 0...(len - size) {
            let range = Range(
                start: start.advancedBy(advance),
                end: start.advancedBy(advance + size)
            )
            let slice = digits.substringWithRange(range)
            sliceList.append(slice
                .characters
                .map{Int(String($0))!}
            )
        }
        return sliceList
    }
}
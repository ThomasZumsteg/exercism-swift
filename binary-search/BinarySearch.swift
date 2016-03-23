/*BinarySearchError are the errors that occur during a binary search*/
enum BinarySearchError: ErrorType {
    case Unsorted
}

/*BinarySearch finds the index of a number in a list*/
class BinarySearch {
    var list: [Int]
    var middle: Int
    
    /*init checks that the list is ordered*/
    init(_ list: [Int]) throws {
        self.list = list
        self.middle = list.count / 2
        for var i = 1; i < list.count; i++ {
            if !(list[i-1] <= list[i]) {
                throw BinarySearchError.Unsorted
            }
        }
    }
    
    /*searchFor finds the index of a number if it exists*/
    func searchFor(n: Int) -> Int? {
        var first = 0, last = list.count
        while first <= last {
            switch (first + last) / 2 {
            case let middle where list[middle] == n:
                return middle
            case let middle where list[middle] < n:
                first = middle + 1
            case let middle where list[middle] > n:
                last = middle - 1
            default: break
            }
        }
        return nil
    }
}
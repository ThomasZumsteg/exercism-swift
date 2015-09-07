import Foundation

class ETL {
    class func transform(old:[Int:[String]]) -> [String: Int] {
        var new = [String: Int]()
        for (key, values) in old {
            for v in values {
                new[v.lowercaseString] = key
            }
        }
        return new
    }
}
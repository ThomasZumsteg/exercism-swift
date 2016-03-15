import Foundation

class Gigasecond {
    var description: String = ""
    init?(from: String) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.dateFromString(from) {
            let later = date.dateByAddingTimeInterval(1_000_000_000)
            description = dateFormatter.stringFromDate(later)
        } else {
            return nil
        }
    }
}
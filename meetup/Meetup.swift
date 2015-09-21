import Foundation

class Meetup {
    let year:Int, month:Int
    let dateFormatter = NSDateFormatter()
    
    init(year:Int, month:Int) {
        self.year = year
        self.month = month
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    func day(weekDay:Int, which: String) -> NSDate {
        return dateFormatter.dateFromString("2013-5-13")!
    }
}
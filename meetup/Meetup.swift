import Foundation

class Meetup {
    let year:Int, month:Int
    let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
    let dateFormatter = NSDateFormatter()
    
    init(year:Int, month:Int) {
        self.year = year
        self.month = month
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    func day(weekDay: Int, which: String) -> NSDate {
        let monthStub = "\(year)-\(month)-"
        
        switch which {
        case "1st":
            return findInRange(monthStub, range: 1.stride(to: 8, by: 1), weekDay: weekDay)!
        case "2nd":
            return findInRange(monthStub, range: 8.stride(to: 15, by: 1), weekDay: weekDay)!
        case "3rd":
            return findInRange(monthStub, range: 15.stride(to: 22, by: 1), weekDay: weekDay)!
        case "4th":
            return findInRange(monthStub, range: 22.stride(to: 29, by: 1), weekDay: weekDay)!
        case "last":
            let monthLength = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: dateFormatter.dateFromString(monthStub + "1")!).length
            return findInRange(monthStub, range: monthLength.stride(to: monthLength - 7, by: -1), weekDay: weekDay)!

        case "teenth":
            return findInRange(monthStub, range: 13.stride(to: 20, by: 1), weekDay: weekDay)!
        default:
            return dateFormatter.dateFromString("2013-5-13")!
        }
    }
    
    private func findInRange(month: String, range days: StrideTo<Int>, weekDay: Int) -> NSDate? {
        for d in days {
            let date = dateFormatter.dateFromString(month + String(format: "%02d", d))!
            let components = calendar.components(.Weekday, fromDate: date)
            if components.weekday == weekDay { return date }
        }
        return nil
    }
}
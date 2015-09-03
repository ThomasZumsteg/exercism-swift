import Foundation

class Year {
    var isLeapYear: Bool
    
    init (calendarYear: Int) {
        let isDivByFour = calendarYear % 4 == 0
        let isCentury = calendarYear % 100 == 0
        let isFourCentury = calendarYear % 400 == 0
        self.isLeapYear = (isDivByFour && !isCentury) || isFourCentury
    }
}
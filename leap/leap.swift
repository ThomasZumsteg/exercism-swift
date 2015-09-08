import Foundation

struct Year {
    var isLeapYear: Bool
    
    init (calendarYear: Int) {
        
        let divBy4   = calendarYear %   4 == 0
        let divBy100 = calendarYear % 100 == 0
        let divBy400 = calendarYear % 400 == 0
        
        self.isLeapYear = (divBy4 && !divBy100) || divBy400
    }
}
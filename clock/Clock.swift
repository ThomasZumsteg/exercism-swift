import Foundation

class Clock: CustomStringConvertible, Comparable {
    let time: Int
    
    init(hours: Int = 0, minutes: Int = 0) {
        let mins: Int = (60 * hours + minutes) % (24 * 60)
        time = mins > 0 ? mins : mins + (24 * 60)
    }
    
    var description: String {
        get {
            return String(format: "%02d:%02d", arguments: [time / 60, time % 60])
        }
    }

    func add(hours: Int = 0, minutes: Int = 0) -> Clock {
        return Clock(hours: hours, minutes: time + minutes)
    }
    
    func subtract(hours: Int = 0, minutes: Int = 0) -> Clock {
        return Clock(hours: hours, minutes: time - minutes)
    }
}

func ==(lhs: Clock, rhs: Clock) -> Bool {
    return lhs.time == rhs.time
}

func <(lhs: Clock, rhs: Clock) -> Bool {
    return lhs.time < rhs.time
}

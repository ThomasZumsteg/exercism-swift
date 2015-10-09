import Foundation

class Clock: NSObject, Comparable {
    let time: Int
    
    init(hours: Int = 0, minutes: Int = 0) {
        let mins: Int = (60 * hours + minutes) % (24 * 60)
        time = mins > 0 ? mins : mins + (24 * 60)
    }
    
    override var description: String {
        get {
            return String(format: "%02d:%02d", arguments: [time / 60, time % 60])
        }
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let clock = object as? Clock {
            return time == clock.time
        } else {
            return false
        }
    }

    func add(hours: Int = 0, minutes: Int = 0) -> Clock {
        return Clock(hours: hours, minutes: time + minutes)
    }
    
    func subtract(hours: Int = 0, minutes: Int = 0) -> Clock {
        return Clock(hours: hours, minutes: time - minutes)
    }
}

func <(lhs: Clock, rhs: Clock) -> Bool {
    return lhs.time < rhs.time
}

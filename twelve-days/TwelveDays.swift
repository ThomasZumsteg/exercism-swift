import Foundation

class TwelveDaysSong {
    static func verse(v: Int) -> String {
        if v == 1 {
            return "On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree.\n"
        } else {
            return "On the \(nth[v-1]) day of Christmas my true love gave to me, " +
                items[0..<v].reverse().joinWithSeparator(", ") +
            "\n"
        }
    }
    
    static func verses(start: Int, _ stop: Int) -> String {
        return Array(start...stop)
            .map({verse($0) + "\n"})
            .joinWithSeparator("")
    }
    
    static func sing() -> String {
        return TwelveDaysSong.verses(1, 12)
    }
    
    private static let items = [
        "and a Partridge in a Pear Tree.",
        "two Turtle Doves",
        "three French Hens",
        "four Calling Birds",
        "five Gold Rings",
        "six Geese-a-Laying",
        "seven Swans-a-Swimming",
        "eight Maids-a-Milking",
        "nine Ladies Dancing",
        "ten Lords-a-Leaping",
        "eleven Pipers Piping",
        "twelve Drummers Drumming",
    ]

    private static let nth: [String]! = [
        "first",
        "second",
        "third",
        "fourth",
        "fifth",
        "sixth",
        "seventh",
        "eighth",
        "ninth",
        "tenth",
        "eleventh",
        "twelfth",
    ]
}
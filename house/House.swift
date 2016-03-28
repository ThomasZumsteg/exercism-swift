class House {
    /*recite sings "The House that Jack Built" rhyme*/
    static func recite(start: Int = 0, stop: Int = 11) -> String {
        return Array(start...stop)
            .map{ verse($0) }
            .joinWithSeparator("\n\n")
    }
    
    /*lines is the lines in "The House that Jack Built"*/
    private static let lines = [
        " the house that Jack built.",
        " the malt\nthat lay in",
        " the rat\nthat ate",
        " the cat\nthat killed",
        " the dog\nthat worried",
        " the cow with the crumpled horn\nthat tossed",
        " the maiden all forlorn\nthat milked",
        " the man all tattered and torn\nthat kissed",
        " the priest all shaven and shorn\nthat married",
        " the rooster that crowed in the morn\nthat woke",
        " the farmer sowing his corn\nthat kept",
        " the horse and the hound and the horn\nthat belonged to",
    ]

    /*verse recites a single verse from "The House that Jack Built"*/
    private static func verse(n: Int) -> String {
        return "This is" + lines[0...n]
            .reverse()
            .joinWithSeparator("")
    }
}
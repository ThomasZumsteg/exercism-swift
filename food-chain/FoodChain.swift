class FoodChain {
    /*first is the opening line in "I know an Old Lady"*/
    private static let first: [String] = [
        "a fly.",
        "a spider.\nIt wriggled and jiggled and tickled inside her.",
        "a bird.\nHow absurd to swallow a bird!",
        "a cat.\nImagine that, to swallow a cat!",
        "a dog.\nWhat a hog, to swallow a dog!",
        "a goat.\nJust opened her throat and swallowed a goat!",
        "a cow.\nI don't know how she swallowed a cow!",
        "a horse.\nShe's dead, of course!",
    ]
    
    /*refrain is the repeated lines in "I know an Old Lady"*/
    private static let refrain: [String] = [
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "She swallowed the spider to catch the fly.",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the cat to catch the bird.",
        "She swallowed the dog to catch the cat.",
        "She swallowed the goat to catch the dog.",
        "She swallowed the cow to catch the goat.",
        "",
    ]
    
    /*verse sings a verse of "I know an Old Lady"*/
    static func verse(v: Int) -> String {
        let opening: String =
            "I know an old lady who swallowed "
            + first[v-1]
        let chorus: String = refrain[0..<v]
            .reverse()
            .joinWithSeparator("\n")
        return opening + (v != first.count ? "\n" + chorus : "")
    }
    
    /*song sings the entire "I know an Old Lady" song*/
    static func song() -> String {
        return Array(1...first.count)
            .map({verse($0)})
            .joinWithSeparator("\n\n")
    }
}
import XCTest

class PokerTest: XCTestCase {
    
    var validTestCases:[(name: String, hands:[String], best:String)] = []
    var invalidTestCases:[(name: String, hand:String)] = []
    
    func testInvalidCases(){
        for each in invalidTestCases{
        XCTAssertNil(PokerHand(each.hand), "\(each.name)")
        }
    }
    
    func testAllValid() {
        for each in validTestCases{
            XCTAssertEqual(Poker.bestHand(each.hands), each.best,  "\(each.name)")
        }
    }
    
    func testGetRank() {
        XCTAssertEqual(PokerHand("3♡ 10♢ 7♧ 8♤ A♢")!.getRank(), PokerHand.Rank.HighCard, "HighCard")
        XCTAssertEqual(PokerHand("3♡ 3♤ 5♧ 6♢ 9♢")!.getRank(), PokerHand.Rank.OnePair)
        XCTAssertEqual(PokerHand("2♢ 8♡ 5♢ 2♡ 8♧")!.getRank(), PokerHand.Rank.TwoPair)
        XCTAssertEqual(PokerHand("3♡ 8♡ 3♢ 3♧ 8♧")!.getRank(), PokerHand.Rank.FullHouse)
        XCTAssertEqual(PokerHand("Q♡ K♡ J♢ 10♧ 9♡")!.getRank(), PokerHand.Rank.Straight)
        XCTAssertEqual(PokerHand("4♤ 3♤ 8♤ J♤ K♤")!.getRank(), PokerHand.Rank.Flush)
    }
    
    func testGetGroups() {
        XCTAssertEqual(PokerHand("3♡ 10♢ 7♧ 8♤ A♢")!.getGroups().map{$0.count}, [1,1,1,1,1], "All Different")
        XCTAssertEqual(PokerHand("3♡ 3♤ 5♧ 6♢ 9♢")!.getGroups().map({$0.count}).sort(), [1,1,1,2], "One Pair")
        XCTAssertEqual(PokerHand("2♢ 8♡ 5♢ 2♡ 8♧")!.getGroups().map({$0.count}).sort(), [1,2,2])
        XCTAssertEqual(PokerHand("3♡ 8♡ 3♢ 3♧ 8♧")!.getGroups().map({$0.count}).sort(), [2,3])
    }
    
    func testRankLessThan() {
        XCTAssertTrue(PokerHand.Rank.OnePair < PokerHand.Rank.Flush)
        XCTAssertFalse(PokerHand.Rank.Flush < PokerHand.Rank.Flush)
        XCTAssertTrue(PokerHand.Rank.StraighFlush > PokerHand.Rank.Flush)
        XCTAssertTrue(PokerHand.Rank.HighCard < PokerHand.Rank.Flush)
    }
    
    func testLessThan() {
        XCTAssertTrue(PokerHand("3♡ 10♢ 7♧ 8♤ A♢") <
            PokerHand("3♡ 8♡ 3♢ 3♧ 8♧"))
        XCTAssertTrue(PokerHand("2♢ 8♡ 5♢ 2♡ 8♧") < PokerHand("4♢ J♧ 4♤ J♤ K♤"))
    }
    
    override func setUp() {
        super.setUp()
        
    validTestCases = [  
        (
            name:  "single hand is always best",
            hands: ["3♡ 10♢ 7♧ 8♤ A♢"],
            best:  "3♡ 10♢ 7♧ 8♤ A♢"
        ),
        (
            name:  "highest card",
            hands: ["3♢ 2♢ 5♤ 6♤ 9♡", "3♡ 2♡ 5♧ 6♢ 10♡"],
            best:  "3♡ 2♡ 5♧ 6♢ 10♡"
        ),
        (
            name:  "One pair",
            hands: ["3♢ 2♢ 5♤ 6♤ 9♡", "3♡ 3♤ 5♧ 6♢ 9♢"],
            best:  "3♡ 3♤ 5♧ 6♢ 9♢"
        ),
        (
            name:  "pair beats lower",
            hands: ["4♢ 3♤ 4♤ J♤ K♤", "A♡ K♡ J♢ 10♧ 9♡"],
            best:  "4♢ 3♤ 4♤ J♤ K♤"
        ),
        (
            name:  "best pair",
            hands: ["4♡ 2♡ 5♧ 4♢ 10♡", "3♢ 3♡ 5♤ 6♤ 9♡"],
            best:  "4♡ 2♡ 5♧ 4♢ 10♡"
        ),
        (
            name:  "best pair with same pair and highest cards",
            hands: ["4♡ 2♡ 5♧ 4♢ 10♡", "4♤ 4♧ 5♡ 10♢ 3♡"],
            best:  "4♤ 4♧ 5♡ 10♢ 3♡"
        ),
        (
            name: "two pair beats lower",
            hands: [
                "4♢ 3♤ 4♤ J♤ K♤",
                "A♡ K♡ J♢ 10♧ 9♡",
                "2♢ 8♡ 5♢ 2♡ 8♧",
            ],
            best:  "2♢ 8♡ 5♢ 2♡ 8♧"
        ),
        (
            name: "best two pair",
            hands: [
                "4♢ J♧ 4♤ J♤ K♤",
                "A♡ K♡ J♢ 10♧ 9♡",
                "2♢ 8♡ 5♢ 2♡ 8♧",
            ],
            best:  "4♢ J♧ 4♤ J♤ K♤"
        ),
        (
            name: "best two pair with equal highest pair",
            hands: [
                "4♢ J♧ 4♤ J♤ K♤",
                "A♡ K♡ J♢ 10♧ 9♡",
                "3♢ J♡ 5♢ 3♡ J♢",
            ],
            best:  "4♢ J♧ 4♤ J♤ K♤"
        ),
        (
            name: "best two pair with equal pairs",
            hands: [
                "4♢ J♧ 4♤ J♤ 2♤",
                "A♡ K♡ J♢ 10♧ 9♡",
                "4♧ J♡ 5♢ 4♡ J♢",
            ],
            best:  "4♧ J♡ 5♢ 4♡ J♢"
        ),
        (
            name: "full house",
            hands: [
                "4♢ 3♤ 4♤ J♤ K♤",
                "A♡ K♡ J♢ 10♧ 9♡",
                "3♡ 8♡ 3♢ 3♧ 8♧",
                "2♢ 8♡ 5♢ 2♡ 8♧",
            ],
            best:  "3♡ 8♡ 3♢ 3♧ 8♧"
        ),
        (
            name: "best three of a kind",
            hands: [
                "4♢ 3♤ 4♤ J♤ 4♡",
                "A♡ K♡ J♢ 10♧ 9♡",
                "3♢ 8♡ 3♡ 3♧ 9♧",
                "2♢ 8♡ 5♢ 2♡ 8♧",
            ],
            best:  "4♢ 3♤ 4♤ J♤ 4♡"
        ),
        (
            name: "straight beats lower",
            hands: [
                "4♢ 3♤ 4♤ J♤ K♤",
                "Q♡ K♡ J♢ 10♧ 9♡",
                "3♡ 8♡ 3♢ 3♧ 9♧",
                "2♢ 8♡ 5♢ 2♡ 8♧",
            ],
            best:  "Q♡ K♡ J♢ 10♧ 9♡"
        ),
        (
            name: "straight includes ace as one",
            hands: [
                "4♢ 3♤ 4♤ J♤ K♤",
                "2♤ 3♡ A♤ 5♤ 4♤",
                "3♢ 8♡ 3♡ 3♧ 9♧",
                "2♢ 8♡ 5♢ 2♡ 8♧",
            ],
            best:  "2♤ 3♡ A♤ 5♤ 4♤"
        ),
        (
            name: "best straight",
            hands: [
                "4♢ 3♤ 4♤ J♤ K♤",
                "Q♡ K♡ J♢ 10♧ 9♡",
                "A♢ K♧ 10♢ J♢ Q♢",
                "2♢ 8♡ 5♢ 2♡ 8♧",
            ],
            best:  "A♢ K♧ 10♢ J♢ Q♢"
        ),
        (
            name: "flush beats lower",
            hands: [
                "4♤ 3♤ 8♤ J♤ K♤",
                "Q♡ K♡ J♢ 10♧ 9♡",
                "3♢ 8♡ 3♢ 3♧ 9♧",
                "2♢ 8♡ 5♢ 2♡ 8♧",
            ],
            best:  "4♤ 3♤ 8♤ J♤ K♤"
        ),
        (
            name: "best flush",
            hands: [
                "4♤ 3♤ 8♤ J♤ K♤",
                "Q♡ K♡ J♢ 10♧ 9♡",
                "3♢ 8♢ A♢ 2♢ 7♢",
                "2♢ 8♡ 5♢ 2♡ 8♧",
            ],
            best:  "3♢ 8♢ A♢ 2♢ 7♢"
        ),
        (
            name: "full house beats lower",
            hands: [
                "4♤ 3♤ 8♤ J♤ K♤",
                "2♢ 8♡ 8♢ 2♡ 8♧",
                "Q♡ K♡ J♢ 10♧ 9♡",
                "3♡ A♡ 3♢ 3♧ A♧",
            ],
            best:  "2♢ 8♡ 8♢ 2♡ 8♧"
        ),
        (
            name: "best full house",
            hands: [
                "4♤ 3♤ 8♤ J♤ K♤",
                "2♢ 8♡ 8♢ 2♡ 8♧",
                "5♡ 5♢ A♤ 5♧ A♢",
                "3♡ A♡ 3♢ 3♧ A♧",
            ],
            best:  "2♢ 8♡ 8♢ 2♡ 8♧"
        ),
        (
            name: "four of a kind beats lower",
            hands: [
                "4♤ 5♤ 8♤ J♤ K♤",
                "2♢ 8♡ 8♢ 2♡ 8♧",
                "Q♡ K♡ J♢ 10♧ 9♡",
                "3♢ 3♡ 3♤ 3♧ A♧",
            ],
            best:  "3♢ 3♡ 3♤ 3♧ A♧"
        ),
        (
            name: "best four of a kind",
            hands: [
                "4♤ 5♤ 8♤ J♤ K♤",
                "2♢ 2♧ 8♢ 2♡ 2♤",
                "Q♡ K♡ J♢ 10♧ 9♡",
                "3♢ 3♡ 3♤ 3♧ A♧",
            ],
            best:  "3♢ 3♡ 3♤ 3♧ A♧"
        ),
        (
            name: "straight flush beats lower",
            hands: [
                "4♤ 4♢ 4♡ 4♧ K♤",
                "2♢ 8♡ 8♢ 2♡ 8♧",
                "Q♡ K♡ 8♡ 10♡ 9♡",
                "2♤ 3♤ A♤ 5♤ 4♤",
            ],
            best:  "2♤ 3♤ A♤ 5♤ 4♤"
        ),
        (
            name: "best straight flush is royal flush",
            hands: [
                "4♤ 5♤ 8♤ J♤ K♤",
                "2♢ 8♡ 8♢ 2♡ 8♧",
                "Q♡ K♡ J♡ 10♡ 9♡",
                "Q♢ K♢ J♢ 10♢ A♢",
            ],
            best:  "Q♢ K♢ J♢ 10♢ A♢"
        ),
        (
            name:  "tie for best pair: brake tide by suit",
            hands: ["4♡ 2♡ 5♧ 4♢ 10♡", "4♧ 10♢ 5♤ 2♤ 4♤"],
            best:  "4♡ 2♡ 5♧ 4♢ 10♡"
        ),
        (
            name: "tie of three: brake tide by suit",
            hands: [
                "A♡ 2♡ 3♡ 4♡ 5♡",
                "A♤ 2♤ 3♤ 4♤ 5♤",
                "5♧ 4♧ 3♧ 2♧ A♧",
                "A♢ 2♢ 6♢ 4♢ 5♢",
            ],
            best:  "A♤ 2♤ 3♤ 4♤ 5♤"
        ),
    ]
    
    invalidTestCases  =
    [
        (
            name: "1 is an invalid card rank",
            hand: "1♢ 2♡ 3♡ 4♡ 5♡"
        ),
        (
            name: "15 is an invalid card rank",
            hand: "15♢ 2♡ 3♡ 4♡ 5♡"
        ),
        (
            name: "too few cards",
            hand: "2♡ 3♡ 4♡ 5♡"
        ),
        (
            name: "too many cards",
            hand: "2♡ 3♡ 4♡ 5♡ 6♡ 7♡"
        ),
        (
            name: "lack of rank",
            hand: "11♢ 2♡ ♡ 4♡ 5♡"
        ),
        (
            name: "lack of suit",
            hand: "2♡ 3♡ 4 5♡ 7♡"
        ),
        (
            name: "H is an invalid suit",
            hand: "2♡ 3♡ 4H 5♡ 7♡"
        ),
        (
            name: "♥ is an invalid suit",
            hand: "2♡ 3♡ 4♥ 5♡ 7♡"
        ),
        (
            name: "lack of spacing",
            hand: "2♡ 3♡ 5♡7♡ 8♡"
        ),
        (
            name: "double suits after rank",
            hand: "2♡ 3♡ 5♡♡ 8♡ 9♡"
        ),
    ]
    
    }
    
    
}

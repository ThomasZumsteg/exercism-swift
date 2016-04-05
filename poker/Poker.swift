import Foundation

class Poker {
    static func bestHand(hands: [String]) -> String {
        return hands
            .map({PokerHand($0)})
            .maxElement(<)!!
            .hand
    }
}

struct Card {
    let value, suit: Int
}

class PokerHand {
    let hand: String
    var cards = [Card]()
    
    enum Error: ErrorType {
        case InvalidSuit, InvalidRank
    }

    enum Rank: Int {
        case HighCard = 0, OnePair, TwoPair, ThreeOfAKind, Straight, Flush, FullHouse, FourOfAKind, StraighFlush
    }
    
    init?(_ hand: String) {
        self.hand = hand
        do {
            self.cards = try hand
                .componentsSeparatedByString(" ")
                .map({Card(
                    value: try getValue($0),
                    suit: try getSuit($0))
                })
        } catch {
            return nil
        }
        if cards.count != 5 {
            return nil
        }
    }
    
    func getValue(card: String) throws -> Int {
        let rank = card.substringToIndex(card.endIndex.predecessor())
        switch rank {
        case "2", "3", "4", "5", "6", "7", "8", "9", "10":
            return Int(rank)!
        case "J":
            return 11
        case "Q":
            return 12
        case "K":
            return 13
        case "A":
            return 14
        default:
            throw Error.InvalidRank
        }
    }
    
    func getSuit(card: String) throws -> Int {
        let suit = card.substringFromIndex(card.endIndex.predecessor())
        if let suitScore = ["♡", "♢", "♧", "♤"].indexOf(suit) {
            return suitScore
        }
        throw Error.InvalidSuit
    }

    private func isFlush() -> Bool {
        return cards
            .reduce(true){$0 && $1.suit == cards[0].suit}
    }
    
    private func isStraight() -> Bool {
        let ranks = cards.map({$0.value})
        if ranks == [2,3,4,5,14] {
            return true
        }
        for var i = 1; i < ranks.count; i++ {
            if ranks[i-1] + 1 != ranks[i] {
                return false
            }
        }
        return true
    }
    
    private func getRank() -> Int {
        let cardGroups = [1,1,1,1,1]
        
        switch true {
        case isFlush() && isStraight():
            return Rank.StraighFlush.rawValue
        case cardGroups == [1,4]:
            return Rank.FourOfAKind.rawValue
        case cardGroups == [2,3]:
            return Rank.FullHouse.rawValue
        case isFlush() && !isStraight():
            return Rank.Flush.rawValue
        case !isFlush() && isStraight():
            return Rank.Straight.rawValue
        case cardGroups == [1,1,3]:
            return Rank.ThreeOfAKind.rawValue
        case cardGroups == [1,2,2]:
            return Rank.TwoPair.rawValue
        case cardGroups == [1,1,1,2]:
            return Rank.OnePair.rawValue
        default:
            return Rank.HighCard.rawValue
        }
   }

}

func <(lhs: PokerHand?, rhs: PokerHand?) -> Bool {
    guard let leftHand = lhs else {
        return true
    }
    guard let rightHand = rhs else {
        return false
    }
    
    if leftHand.getRank() != rightHand.getRank() {
        return leftHand.getRank() < rightHand.getRank()
    }
    
    for (leftCard, rightCard) in zip(leftHand.cardGroups(), rightHand.cardGroups()) {

    }
    return true
}

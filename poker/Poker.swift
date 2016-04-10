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

class PokerHand: Comparable {
    let hand: String
    var cards = [Card]()
    
    enum Error: ErrorType {
        case InvalidSuit, InvalidRank
    }

    enum Rank: Int {
        case HighCard, OnePair, TwoPair, ThreeOfAKind, Straight, Flush, FullHouse, FourOfAKind, StraighFlush
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
        if let suitScore = ["♧", "♢", "♡", "♤"].indexOf(suit) {
            return suitScore
        }
        throw Error.InvalidSuit
    }

    func isFlush() -> Bool {
        return cards
            .reduce(true){$0 && $1.suit == cards[0].suit}
    }
    
    func isStraight() -> Bool {
        let ranks = cards.map({$0.value}).sort(<)
        if ranks == [2,3,4,5,14] {
            return true
        }
        for i in 1 ..< ranks.count {
            if ranks[i-1] + 1 != ranks[i] {
                return false
            }
        }
        return true
    }
    
    func getGroups() -> [[Card]] {
        var groups = [Int: [Card]]()
        for card in cards {
            if let group = groups[card.value] {
                groups[card.value] = group + [card]
            } else {
                groups[card.value] = [card]
            }
        }
        return groups
            .sort(byGroupSizeThenRank)
            .map({ $0.1.sort(bySuit) })
    }
    
    func byGroupSizeThenRank(leftGroup: (Int, [Card]), rightCards: (Int, [Card])) -> Bool {
        if leftGroup.1.count != rightCards.1.count {
            return leftGroup.1.count > rightCards.1.count
        }
        return leftGroup.0 > rightCards.0
    }
    
    func bySuit(leftCard: Card, rightCard: Card) -> Bool {
        return leftCard.suit > rightCard.suit
    }
    
    func getRank() -> PokerHand.Rank {
        let cardGroups = getGroups().map({$0.count}).sort(<)
        
        switch true {
        case isFlush() && isStraight():
            return Rank.StraighFlush
        case cardGroups == [1,4]:
            return Rank.FourOfAKind
        case cardGroups == [2,3]:
            return Rank.FullHouse
        case isFlush() && !isStraight():
            return Rank.Flush
        case !isFlush() && isStraight():
            return Rank.Straight
        case cardGroups == [1,1,3]:
            return Rank.ThreeOfAKind
        case cardGroups == [1,2,2]:
            return Rank.TwoPair
        case cardGroups == [1,1,1,2]:
            return Rank.OnePair
        default:
            return Rank.HighCard
        }
   }

}

func <<T: RawRepresentable where T.RawValue: Comparable>(a: T, b: T) -> Bool {
    return a.rawValue < b.rawValue
}

extension PokerHand.Rank: Comparable { }

func <(lhs: PokerHand, rhs: PokerHand) -> Bool {
    if lhs.getRank() != rhs.getRank() {
       return lhs.getRank() < rhs.getRank()
    }
    
    let rightCards = rhs
        .getGroups()
        .reduce([], combine: +)
    let leftCards = lhs
        .getGroups()
        .reduce([], combine: +)
    
    for (leftCard, rightCard) in zip(leftCards, rightCards) {
        if leftCard.value != rightCard.value {
            return leftCard.value < rightCard.value
        }
    }

    let maxLeft = leftCards.maxElement({ $0.value < $1.value})!
    let maxRight=rightCards.maxElement({ $0.value < $1.value})!
    
    return maxLeft.suit < maxRight.suit
}

func ==(lhs: PokerHand, rhs: PokerHand) -> Bool {
    return lhs.getRank() == rhs.getRank()
}

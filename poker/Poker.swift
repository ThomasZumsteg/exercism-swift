import Foundation

class Poker {
    static func bestHand(hands: [String]) -> String {
        var best: PokerHand? = nil
        for hand in hands.map({ PokerHand($0) }) {
            if best == nil || (hand != nil && best! < hand!) {
                best = hand
            }
        }
        return best!.hand
    }
}

class PokerHand {
    let hand: String
    var suits = Set<String>()
    var ranks = [Int:Int]()
    
    enum Error: ErrorType {
        case InvalidSuit, InvalidRank
    }
    
    enum Catagory: Int {
        case HighCard = 0, OnePair, TwoPair, ThreeOfAKind, Straight, Flush, FullHouse, FourOfAKind, StraighFlush
    }
    
    init?(_ hand: String) {
        self.hand = hand
        let cards = hand.characters.split{ $0 == " " }
        if cards.count != 5 {
            return nil
        }
        for card in cards.map({ String($0) }) {
            do {
                let suit = try getSuit(card)
                let rank = try getRank(card)
                suits.insert(suit)
                ranks[rank] = (ranks[rank] ?? 0) + 1
            } catch {
                return nil
            }
        }
    }
    
    private func getSuit(card: String) throws -> String {
        let suit = card.substringFromIndex(card.endIndex.predecessor())
        if !["♡", "♢", "♧", "♤"].contains(suit) {
            throw Error.InvalidSuit
        }
        return suit
    }
    
    private func getRank(card: String) throws -> Int {
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
    
    private func isFlush() -> Bool {
        return suits.count == 1
    }
    
    private func isStraight() -> Bool {
        return false
    }
    
    private func rankGroups() -> [Int] {
        return ranks.keys.sort()
    }
    
    private var catagory: Catagory {
        switch true {
        case isFlush() && isStraight(): return Catagory.StraighFlush
        case rankGroups() == [4,1]:
            return Catagory.FourOfAKind
        case rankGroups() == [3,2]:
            return Catagory.FullHouse
        case isFlush() && !isStraight():
            return Catagory.Flush
        case !isFlush() && isStraight():
            return Catagory.Straight
        case rankGroups() == [3,1,1]:
            return Catagory.ThreeOfAKind
        case rankGroups() == [2,2,1]:
            return Catagory.TwoPair
        case rankGroups() == [2,1,1,1]:
            return Catagory.OnePair
        default:
            return Catagory.HighCard
        }
    }
}

func <(lhs: PokerHand, rhs: PokerHand) -> Bool {
    return lhs.catagory.rawValue < rhs.catagory.rawValue
}

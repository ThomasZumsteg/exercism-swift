import Foundation

class Tournament {
    typealias record = (MP:Int, W:Int, D:Int, L:Int, P:Int)
    var scores = [String: record]()
    
    init() { }
    
    func tally(games input: String) -> String {
        let win: record = (MP:1, W:1, D:0, L:0, P:3)
        let loss: record = (MP:1, W:0, D:0, L:1, P:0)
        let draw: record = (MP:1, W:0, D:1, L:0, P:1)
        
        let games: [[String]] = input
            .characters
            .split("\n")
            .map{ $0.split(";")
                .map(String.init)
        }
        
        for g in games {
            guard g.count == 3 else { continue }
            
            let (team1, team2) = (g[0], g[1])
            
            switch g[2] {
            case "win":
                add(team1, win)
                add(team2, loss)
            case "loss":
                add(team1, loss)
                add(team2, win)
            case "draw":
                add(team1, draw)
                add(team2, draw)
            default:
                continue
            }
        }
        return makeScores()
    }
    
    private func add(teamName: String, _ diff: record) {
        let blank = (MP:0, W:0, D:0, L:0, P:0)
        scores[teamName] = scores[teamName] ?? blank
        scores[teamName]!.MP += diff.MP
        scores[teamName]!.W += diff.W
        scores[teamName]!.D += diff.D
        scores[teamName]!.L += diff.L
        scores[teamName]!.P += diff.P
    }
    
    private func makeScores() -> String {
        let header = "Team                           | MP |  W |  D |  L |  P"
        var scores: [String] = [header]
        for (team, rec) in self.scores.sort({$0.1.P > $1.1.P}) {
            let teamName = team.stringByPaddingToLength(31, withString: " ", startingAtIndex: 0)
            let teamScores = String(format: "|  %d |  %d |  %d |  %d |  %d", arguments: [rec.MP, rec.W, rec.D, rec.L, rec.P])
            scores.append(teamName + teamScores)
        }
        return scores.joinWithSeparator("\n")
    }
}
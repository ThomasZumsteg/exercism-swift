import Foundation

extension Array {
    func keep(f: (Element) -> Bool) -> [Element] {
        var kept = [Element]()
        for e in self {
            if f(e) { kept.append(e) }
        }
        return kept
    }
    
    func discard(f: (Element) -> Bool) -> [Element] {
        return self.keep{!f($0)}
    }
}
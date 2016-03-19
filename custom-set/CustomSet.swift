import Foundation

class CustomSet<T: Hashable>: NSObject {
    var items: Set<T>
    
    init(_ items: [T]) {
        self.items = Set(items)
    }
    
    private init(_ items: Set<T>) {
        self.items = items
    }
    
    var size: Int {
        return items.count
    }
    
    override func isEqual(to: AnyObject?) -> Bool {
        guard let other = to as? CustomSet<T> else {
            return false
        }
        return self.items == other.items
    }
    
    var toSortedArray: [T] {
        return items.sort{$0 < $1}
    }
    
    func put(item: T) {
        items.insert(item)
    }
    
    func delete(item: T) {
        items.remove(item)
    }
    
    func removeAll() {
        items.removeAll()
    }
    
    func containsMember(item: T) -> Bool {
        return items.contains(item)
    }
    
    func difference(otherSet: CustomSet<T>) -> CustomSet<T> {
        return CustomSet(items.subtract(otherSet.items))
    }
    
    func isDisjoint(otherSet: CustomSet<T>) -> Bool {
        return items.isDisjointWith(otherSet.items)
    }
    
    func intersection(otherSet: CustomSet<T>) -> CustomSet<T> {
        return CustomSet(items.intersect(otherSet.items))
    }
    
    func isSupersetOf(otherSet: CustomSet<T>) -> Bool {
        return items.isSupersetOf(otherSet.items)
    }
    
    func union(otherSet: CustomSet<T>) -> CustomSet<T> {
        return CustomSet(items.union(otherSet.items))
    }
}
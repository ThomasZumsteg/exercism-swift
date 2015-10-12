import Foundation

class Deque<T> {
    var head: Element<T>?
    
    init() {
        head = nil
    }
    
    func push(value:T) {
        let e = Element(value)
        (e.next, e.prev) = (head ?? e, head?.prev ?? e)
        head = e
        head?.next?.prev = head
        head?.prev?.next = head
    }
    
    func unshift(value:T) {
        self.push(value)
        head = head?.next
    }
    
    func pop() -> T? {
        if let h = head {
            head = h.next
            head?.prev = h.prev
            head?.prev?.next = head
            (h.next, h.prev) = (nil, nil)
            return h.value
        }
        else {
            return nil
        }
    }
    
    func shift() -> T? {
        head = head?.prev
        let value: T? = self.pop()
        return value
        
    }
}

class Element<T> {
    var value: T
    var next: Element<T>? = nil
    var prev: Element<T>? = nil
    
    init(_ value: T) {
        self.value = value
    }
}
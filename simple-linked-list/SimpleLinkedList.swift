import Foundation

class Element<T> {
    let value: T?
    var next: Element<T>?
    
    init(_ value: T? = nil, _ next: Element<T>? = nil) {
        self.value = value
        self.next = next
    }
    
    func toArray() -> Array<T> {
        var a = [T]()
        for var p: Element<T>? = self; p != nil; p = p!.next {
            if let v = p!.value {
                a.append(v)
            }
        }
        return a
    }
    
    func reverseElements() -> Element<T> {
        var p: Element? = nil
        var q: Element? = self
        while q != nil {
            (q!.next, q, p) = (p, q!.next, q)
        }
        return p!
    }
    
    static func fromArray(items: [T]) -> Element<T> {
        var p: Element = Element()
        for v in items.reverse() {
            p = Element(v, p)
        }
        return p
    }
}

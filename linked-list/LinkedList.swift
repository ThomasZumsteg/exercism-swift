import Foundation

class Deque<T> {
    Init
}

class Element<T> {
    var value: T
    var next: Element<T>?
    var prev: Element<T>?
    
    init(_ value: T) {
        self.value = value
    }
}
# Linked List

Write a Singly-Linked List implementation that uses the Proxy pattern

Deques have four fundamental operations (using Array terminology):

* push (insert value at back)
* unshift (insert value at front)
* pop (remove value at back)
* shift (remove value at front)

The difference between deque and Array performance is that a deque
implements all of these operations in constant time. Even clever
implemetations of Array will often have to copy the entire Array in
order to unshift.

Under the hood we'll use an Element class with two fields, `next` and
`prev`, that are both writable.

To make the API usable, you'll use a Deque class as a proxy for this
list. There two good ways to implement Deque: maintain separate
references to the first and last Element, or maintain a reference to one
of them and ensure that the list is circular.

To keep your implementation simple, the tests will not cover error
conditions. Specifically: pop or shift will never be called on an empty
Deque.

In languages that do not have good support for mutability (such as
Elixir or Erlang), you may choose to implement a functional Deque where
shift and pop have amortized O(1) time. The simplest data structure for
this will have a pair of linked lists for the front and back, where
iteration order is front ++ reverse back.

## Setup

Go through the project setup instructions for Xcode using Swift:

http://help.exercism.io/getting-started-with-swift.html


## Source

Inspired by 'Data Structures and Algorithms with Object-Oriented Design Patterns in Ruby', singly linked-lists. [view source](http://www.brpreiss.com/books/opus8/html/page96.html#SECTION004300000000000000000)

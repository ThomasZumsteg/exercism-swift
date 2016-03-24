/*BinarySearchTree is a node in a binary search tree*/
class BinarySearchTree<T:Comparable> {
    var data: T
    var left: BinarySearchTree<T>? = nil, right: BinarySearchTree<T>? = nil
    
    /*init creates a new node*/
    init(_ data: T) {
        self.data = data
        
    }
    
    /*insert adds a new value to the binary tree*/
    func insert(d: T) {
        let (set, node) = data < d ? (setRight, right): (setLeft, left)
        if let bst = node {
            bst.insert(d)
        } else {
            set(BinarySearchTree(d))
        }
    }
    
    /*allData shows all the data in the tree*/
    func allData() -> [T] {
        let leftData = left == nil ? [] : left!.allData()
        let rightData = right == nil ? [] : right!.allData()
        return leftData + [data] + rightData
    }
    
    /*setLeft sets the left node of the tree*/
    private func setLeft(bst: BinarySearchTree<T>) {
        left = bst
    }
    
    /*setRight sets the right node of the tree*/
    private func setRight(bst: BinarySearchTree<T>) {
        right = bst
    }
}
//
//  main.swift
//  BST
//
//  Created by Emiko Clark on 11/27/17.
//  Copyright © 2017 Emiko Clark. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class BST {
    var rootNode: Node?
    var inserted = false
    
    func intializeTree() {
        bst.insert(value: 40)
        bst.insert(value: 9)
        bst.insert(value: 6)
        bst.insert(value: 11)
        bst.insert(value: 27)
        bst.insert(value: 88)
        bst.insert(value: 72)
        bst.insert(value: 94)
        bst.insert(value: 101)
    }
    
    func insert(value: Int) {
        // insert value and build a binary tree
        var next = rootNode
        let new = Node(value: value)
        var output = ""
        
        if rootNode == nil {
            // insert root node
            rootNode = new
        }
        
        else {
            inserted = false
            output = "root:\(String(describing: (rootNode?.value)!)) "
            // not root node
            while (!inserted) {
                // traverse left
                if value < (next?.value)! {
                    if next?.left != nil {
                        next = next?.left
                        output += "l:\(String(describing: (next?.value)!)) "
                    } else {
                        next?.left = new
                        inserted = true
                        output += "l:\(String(describing: new.value)) "
                    }

                // traverse right
                } else {
                    if next?.right != nil {
                        next = next?.right
                        output += "r:\(String(describing: (next?.value)!)) "
                    } else {
                        next?.right = new
                        inserted = true
                        output += "r:\(String(describing: new.value)) "
                    }
                }
            }
            print(output)
        }
    }
    func traversePreOrder(node: Node) -> Void {
        // inorder search: root, left, right
        let next = node
        
        // process root
        print(" \(String(describing: (next.value))) ")
        
        if next.left != nil {
            traverseInOrder(node: (next.left)!)
        }

        if next.right != nil {
            // process right
            traverseInOrder(node: (next.right)!)
        }
        return
    }
    
    func traverseInOrder(node: Node) -> Void {
        // inorder search: left, root, right
        let next = node
        
        if next.left != nil {
            traverseInOrder(node: (next.left)!)
        }
        
        // process root
        print(" \(String(describing: (next.value))) ")
        
        if next.right != nil {
            // process right
            traverseInOrder(node: (next.right)!)
        }
        return
    }
    
    func traversePostOrder(node: Node) -> Void {
        // search left, right, root
        let next = node
        
        if next.left != nil {
            traversePostOrder(node: next.left!)
        }
        if next.right != nil {
            traversePostOrder(node: next.right!)
        }
        print(" \(String(describing: (next.value))) ")
    }
}

let bst = BST()
print("\nBuild Binary Tree")
bst.intializeTree()
print("\nTraverse Pre-Order")
bst.traverseInOrder(node: bst.rootNode!)
print("\nTraverse In-Order")
bst.traversePostOrder(node: bst.rootNode!)
print("\nTraverse Post-Order")
bst.traversePreOrder(node: bst.rootNode!)


//
//  linkedList.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/03.
//

import Foundation

class LinkedList<T> {
    var head : Node<T>?
    var tail : Node<T>?
    func append(data: T?) {
        let node = Node(data: data)
        if head == nil {
            head = node
            tail = head
            return
        }else {
            tail?.next = node
        }
        node.next = head
        tail = node
    }
    func pop(Index : Int ) -> Node<T>? {
        if head == nil {
            return nil
        }
        if Index == 1 {
            return head
        }
        var indexCount = 1
        var node = head
        while indexCount != Index {
            if node?.next === head {break}
            node = node?.next
            indexCount += 1
        }
        let result = node?.next
        node?.next = node?.next?.next
        return result
    }
    func insert(data:T?, index: Int) {
        if head == nil {
            head = Node(data: data)
            tail = head
            return
        }
        let newNode = Node(data: data)
        guard let frontNode = findNode(at: index-1) else {
            self.tail?.next = newNode
            self.tail = newNode
            return
        }
        guard let nextNode = frontNode.next else {
            frontNode.next = newNode
            self.tail = newNode
            return
        }
        newNode.next = nextNode
        frontNode.next = newNode
    }
    func findNode(at index: Int) -> Node<T>? {
        if index < 1 {
            return head
        }
        guard var node = self.head else {
            return nil
        }
        for _ in 1...index {
            guard let nextNode = node.next else {
                return nil
            }
            node = nextNode
        }
        return node
    }
    func delete(Index : Int ) {
        guard let frontNode = findNode(at: Index-1) else {
            return
        }
        guard let removeNode = frontNode.next else {
            return
        }
        guard let nextNode = removeNode.next else {
            frontNode.next = nil
            self.tail = frontNode
            return
        }
        frontNode.next = nextNode
    }
    func listToString() -> String{
        if head == nil {
            return ""
        }
        var result = ""
        var node = head
        while node !== tail {
            result += String(describing: node!.data!)
            node = node?.next
        }
        result += String(describing: node!.data!)
        return result
        
    }
    func size() -> Int {
            guard var node = self.head else {
                return 0
            }
            var count = 0
            while node.next != nil {
                count += 1
                node = node.next!
            }
            return count
        }
}

class Node<T> {
    var data: T?
    var next : Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

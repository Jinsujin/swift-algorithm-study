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
            return
        }
        if index == 0 {
            head = Node(data: data, next: head)
            tail?.next = head
            return
        }
        var tempIndex = 0
        var node = head
        while tempIndex != index {
            if node?.next === head {break}
            node = node?.next
            tempIndex += 1
        }
        let nextNode = node?.next
        node?.next = Node(data: data)
        node?.next?.next = nextNode
        if node?.next?.next === head {
            tail = node?.next
        }
    }
    func delete(Index : Int ) {
        if head == nil {
            return
        }
        if Index == 0 || head?.next === head {
            head = head?.next
            tail?.next = head
            return
        }
        var tempIndex = 0
        var node = head
        while tempIndex < Index-1 {
            if node?.next?.next === head {break}
            node = node?.next
            tempIndex += 1
        }
        node?.next = node?.next?.next
        if node?.next === head {
            tail = node
        }
        if node === head {
            head = node?.next
        }
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
}

class Node<T> {
    var data: T?
    var next : Node?

    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

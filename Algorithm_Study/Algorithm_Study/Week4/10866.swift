//
//  10866.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/02/27.
//

import Foundation

struct Deque<T: Equatable> {
    var dequeList = DoublyLinkedList<T>()
    var size: Int {
        return dequeList.countNode
    }
    var isEmpty: Bool {
        return dequeList.countNode == 0
    }
    var front: T? {
        return dequeList.head?.data
    }
    var back: T? {
        return dequeList.tail?.data
    }
    
    mutating func pushFront(data: T) {
        dequeList.pushFront(data: data)
    }
    
    mutating func pushBack(data: T) {
        dequeList.pushBack(data: data)
    }
    
    mutating func popFront() -> T? {
        return dequeList.popFront()
    }
    
    mutating func popBack() -> T? {
        return dequeList.popBack()
    }
    
}

struct DoublyLinkedList<T: Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    var countNode = 0
    
    mutating func pushFront(data: T) {
        let newNode = Node(data: data)
        
        if head == nil {
            head = newNode
            tail = newNode
            countNode += 1
            return
        }
        
        newNode.next = head
        head?.prev = newNode
        head = newNode
        countNode += 1
    }
    mutating func pushBack(data: T) {
        let newNode = Node(data: data)
        
        if tail == nil {
            head = newNode
            tail = newNode
            countNode += 1
            return
        }
        
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
        countNode += 1
    }
    mutating func popFront() -> T? {
        let temp = head
        if head == nil {
            tail = nil
            countNode = 0
            return nil
        } else if head?.next == nil && tail?.prev == nil {
            head = nil
            tail = nil
            countNode = 0
            return temp?.data
        }
        head = head?.next
        head?.prev = nil
        countNode -= 1
        return temp?.data
    }
    mutating func popBack() -> T? {
        let temp = tail
        if tail == nil {
            head = nil
            countNode = 0
            return nil
        } else if head?.next == nil && tail?.prev == nil {
            head = nil
            tail = nil
            countNode = 0
            return temp?.data
        }
        tail = tail?.prev
        tail?.next = nil
        countNode -= 1
        return temp?.data
    }
    func index(of data: T) -> Int {
        var count = 0
        var tempNode = head
        while tempNode?.next != nil {
            if tempNode?.data == data {
                break
            }
            tempNode = tempNode?.next
            count += 1
        }
        return count
    }
}

class Node<T: Equatable> {
    var data: T
    var next: Node<T>?
    var prev: Node<T>?
    init(data: T) {
        self.data = data
    }
}
func mySolutionOf10866() {
    var myDeque = Deque<Int>()
    let caseCount = Int(readLine()!)!
    for _ in 0..<caseCount {
        let inputString = readLine()!.split(separator: " ").map{String($0)}
        switch inputString[0] {
            case "push_back":
                myDeque.pushBack(data: Int(inputString[1])!)
            case "push_front":
                myDeque.pushFront(data: Int(inputString[1])!)
            case "pop_front":
                print(myDeque.popFront() ?? -1)
            case "pop_back":
                print(myDeque.popBack() ?? -1)
            case "size":
                print(myDeque.size)
            case "empty":
                print(myDeque.isEmpty ? 1 : 0)
            case "front":
                print(myDeque.front ?? -1)
            case "back":
                print(myDeque.back ?? -1)
            default: return
        }
    }
}

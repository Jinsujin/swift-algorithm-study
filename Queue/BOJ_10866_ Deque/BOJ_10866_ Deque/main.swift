//
//  main.swift
//  BOJ_10866_ Deque
//
//  Created by 박진섭 on 2022/02/27.
//
class Node<T> {
    var prev:Node?
    var data:T?
    var next:Node?

    init(prev:Node? = nil ,data:T?,next:Node? = nil ) {             //nil값을 미리 주면 init시 편리하다.
        self.prev = prev
        self.data = data
        self.next = next
    }
}

class DoublyLinkedList<T:Equatable> {
    private var head:Node<T>?
    private var tail:Node<T>?
    private var dataCount:Int = 0
    
    
    //push
    func push_front(input:T?) {
        let newHeadNode = Node(data:input)
        //head가 없으면,,
        if head == nil {
            head = newHeadNode
            tail = head
        } else {
            newHeadNode.next = head
            head?.prev = newHeadNode
            head = newHeadNode
        }
        self.dataCount += 1
    }
    
    func push_back(input:T?) {
        let newTailNode = Node(data:input)
        //tail이 없으면.
        if  tail == nil {
            tail = newTailNode
            head = tail
        } else {
            tail?.next = newTailNode
            newTailNode.prev = tail
            tail = newTailNode
        }
        self.dataCount += 1
    }

    func pop_front() {
        //아무것도 없으면,
        if head == nil { return print(-1) }
        
        //한개밖에 없으면
        if head?.next == nil {
            print(head!.data!)
            head = nil
            tail = nil
        } else {
            print(head!.data!)
            head?.next?.prev = nil
            head = head?.next
        }
        self.dataCount -= 1
    }

    func pop_back() {
        //tail이 없으면
        if tail == nil { return print(-1) }
        //한개 밖에 없으면
        if head?.next == nil {
            print(head!.data!)
            head = nil
            tail = nil
        } else {
            print(tail!.data!)
            tail?.prev?.next = nil
            tail = tail?.prev
        }
        self.dataCount -= 1
    }

    func size() {
        print(dataCount)
    }

    func empty() {
        if head == nil {
            print(1)
        } else {
            print(0)
        }
    }

    func front() {
        if head == nil {
            print(-1)
        } else {
            print(head!.data!)
        }
    }

    func back() {
        if tail == nil {
            print(-1)
        } else {
            print(tail!.data!)
        }
    }
}

//MARK: -- 구현
var deque = DoublyLinkedList<Int>()
let firstInput = Int(readLine()!)!
var count = 0

while count < firstInput {
    let input = readLine()!.split(separator: " ")
    
    if input.count == 1 {
    switch input[0] {
        case "pop_front": deque.pop_front()
        case "pop_back": deque.pop_back()
        case "size":deque.size()
        case "empty":deque.empty()
        case "front":deque.front()
        case "back":deque.back()
    default:
        " "
        }
    }
    
    if input.count == 2     {
        switch input[0] {
        case "push_front": deque.push_front(input: Int(input[1])!)
        case "push_back": deque.push_back(input: Int(input[1])!)
        default:
            " "
        }
    }
    count += 1
}








//
//  1158_요세푸스 문제.swift
//  Algorithm_study
//
//  Created by dale on 2022/01/30.
//

import Foundation

class LinkedList {
    var head : Node?
    var tail : Node?
    func append(data: Int) {
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
    func pop(Index : Int ) -> Node? {
        if head == nil {
            return nil
        }
        if Index == 1 {
            return head
        }
        var indexCount = 1
        var node = head
        while indexCount != Index-1 {
            node = node?.next
            indexCount += 1
        }
        let result = node?.next
        node?.next = node?.next?.next
        return result
    }
}

class Node {
    var data: Int
    var next : Node?

    init(data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
func p1158() {
    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let n = input[0], k = input[1]
    let list = LinkedList()
    (1...n).forEach{list.append(data: $0)}
    var result : [String] = []
    (1...n).forEach{_ in
        let targetNode = list.pop(Index: k)
        list.head = targetNode?.next
        result.append(String((targetNode?.data)!))
    }
    print("<\(result.joined(separator: ", "))>")
}

//func p1158() {
//    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
//    var array = Array(1...input[0])
//    var index = 0, result = "<"
//    while array.count != 1 {
//        index = (index + input[1] - 1) % array.count
//        result +=  String(array.remove(at:index)) + ", "
//    }
//    result += String(array[0]) + ">"
//    print(result)
//}

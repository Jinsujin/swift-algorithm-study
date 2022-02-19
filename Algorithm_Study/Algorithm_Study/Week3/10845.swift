//
//  10845.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/02/19.
//

import Foundation

struct Queue {
    public private(set) var queue = [Int]()
    var isEmpty: Bool {
        return self.queue.isEmpty
    }
    var size: Int {
        return self.queue.count
    }
    var head: Int {
        return self.queue.first ?? -1
    }
    var tail: Int {
        return self.queue.last ?? -1
    }
    
    mutating func push(_ element: Int) {
        self.queue.append(element)
    }
    
    mutating func pop() -> Int {
        return queue.isEmpty ? -1 : self.queue.removeFirst()
    }
    
}

func mySolutionOf10845() {
    var queue = Queue()
    
    let caseCount = Int(readLine()!) ?? 0
    
    for _ in 0..<caseCount {
        let command = readLine()!.components(separatedBy: " ")
        switch command[0] {
        case "push":
            queue.push(Int(command[1])!)
        case "pop":
            print(queue.pop())
        case "size":
            print(queue.size)
        case "empty":
            print(queue.isEmpty == true ? 1 : 0)
        case "front":
            print(queue.head)
        case "back":
            print(queue.tail)
        default:
            continue
        }
    }
}

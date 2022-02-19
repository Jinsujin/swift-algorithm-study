//
//  Queue.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/19.
//

import Foundation

struct Queue {
    var queue : [Int] = []
    var head : Int = 0
    
    var count : Int {
        return queue.count
    }
    
    var isEmpty : Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: Int) {
        queue.append(element)
    }
    
    mutating func dequeue() -> Int {
        return count == 0 ? -1 : queue.removeFirst()
    }
}

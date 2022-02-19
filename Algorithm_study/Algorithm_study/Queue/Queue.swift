//
//  Queue.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/19.
//

import Foundation

struct Queue<T> {
    var queue : [T?] = []
    var head : Int = 0
    
    var count : Int {
        return queue.count
    }
    
    var isEmpty : Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard head <= count, let element = queue[head] else { return nil}
        queue[head] = nil
        head += 1
        
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}

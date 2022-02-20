//
//  Queue.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/19.
//

import Foundation

struct Queue<T> {
    var queue : [T] = []
    var head : Int = 0
    
    var count = 0
    
    var isEmpty : Bool {
        return count - head == 0 ? true : false
    }
    var first : T {
        return queue[head]
    }
    mutating func enqueue(_ element: T) {
        queue.append(element)
        count += 1
    }
    
    mutating func dequeue() -> T {
        if count - head == 0 {
            return -1 as! T
        }else {
            let temp = queue[head]
            head += 1
            return temp
        }
    }
}

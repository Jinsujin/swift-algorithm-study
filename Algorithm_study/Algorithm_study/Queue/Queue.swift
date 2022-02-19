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
    
    var count = 0
    
    var isEmpty : Bool {
        return count - head == 0 ? true : false
    }
    
    mutating func enqueue(_ element: Int) {
        queue.append(element)
        count += 1
    }
    
    mutating func dequeue() -> Int {
        if count - head == 0 {
            return -1
        }else {
            let temp = queue[head]
            head += 1
            return temp
        }
    }
}

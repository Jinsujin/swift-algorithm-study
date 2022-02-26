//
//  Deque.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/26.
//

import Foundation

struct Deque<T:Equatable> {
    var enQueue : [T] = []
    var deQueue : [T] = []
    var oneQueue : [T] {
        return deQueue.reversed() + enQueue
    }
    var size : Int {
        return enQueue.count + deQueue.count
    }
    
    var isEmpty : Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
    
    var front : T? {
        if deQueue.isEmpty {
            return enQueue.first
        }
        return deQueue.last
    }

    var back : T? {
        if enQueue.isEmpty {
            return deQueue.first
        }
        return enQueue.last
    }
    mutating func reverse() {
        let temp = enQueue
        enQueue = deQueue
        deQueue = temp
    }
    func findIndex(of element: T) -> Int {
        oneQueue.firstIndex(where: {$0 == element})!
    }
    
    mutating func pushFirst(_ element: T) {
        deQueue.append(element)
    }
    
    mutating func pushLast(_ element: T) {
        enQueue.append(element)
    }
    
    mutating func popFirst() -> T? {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()
    }
    
    mutating func popLast() -> T? {
        if enQueue.isEmpty {
            enQueue = deQueue.reversed()
            deQueue.removeAll()
            return enQueue.popLast()
        }
        return enQueue.popLast()
    }
}

//
//  18258_큐2.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/19.
//

import Foundation
func p18258() {
    var queue = Queue()
    for _ in 0..<Int(readLine()!)!{
        let input = readLine()!.components(separatedBy: " ")
        switch input[0] {
        case "push" :
            queue.enqueue(Int(input[1])!)
        case "pop" :
            print(queue.dequeue())
        case "size" :
            print(queue.count-queue.head)
        case "empty" :
            print(queue.isEmpty ? 1 : 0)
        case "front":
            print((queue.queue[queue.head]))
        case "back":
            print((queue.queue.last ?? -1)!)
        default :
            break
        }
    }
}

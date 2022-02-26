//
//  덱_10866.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/26.
//

import Foundation

func p10866() {
    var deque = Deque<Int>()
    for _ in 0..<Int(readLine()!)! {
        let input = readLine()!.components(separatedBy: " ")
        switch input[0] {
        case "push_front":
            deque.pushFirst(Int(input[1])!)
        case "push_back" :
            deque.pushLast(Int(input[1])!)
        case "pop_front":
            print(deque.isEmpty ? -1 : deque.popFirst()!)
        case "pop_back":
            print(deque.isEmpty ? -1 : deque.popLast()!)
        case "size":
            print(deque.size)
        case "empty":
            print(deque.isEmpty ? 1 : 0)
        case "front":
            print(deque.isEmpty ? -1 : deque.front!)
        case "back":
            print(deque.isEmpty ? -1 : deque.back!)
        default:
            break
        }
    }
}



//
//  1021_회전하는큐.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/26.
//

import Foundation

func p1021() {
    var minimum : Int = 0
    var deque = Deque<Int>()
    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
    for i in 1...input[0] {
        deque.pushLast(i)
    }
    let targetIndex = readLine()!.components(separatedBy: " ").map{Int($0)!}
    for index in targetIndex {
        while deque.front != index {
            let target = deque.findIndex(of: index)
            (target <= (deque.size-target)) ? moveLeft() : moveRight()
        }
        popFirst()
    }
    print(minimum)
    
    func popFirst() {
        deque.popFirst()
    }
    func moveLeft() {
        deque.pushLast(deque.popFirst()!)
        minimum += 1
    }
    func moveRight() {
        deque.pushFirst(deque.popLast()!)
        minimum += 1
    }
}

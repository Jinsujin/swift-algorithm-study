//
//  1021.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/02/27.
//

import Foundation

func mySolutionOf1021() {
    var myDeque = Deque<Int>()
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    for number in 1...input[0] {
        myDeque.pushBack(data: number)
    }
    var targetIndex = readLine()!.split(separator: " ").map{Int($0)!}
    var countOperations = 0
    
    while !targetIndex.isEmpty {
        let target = targetIndex.removeFirst()
        if target == myDeque.front! {
            myDeque.popFront()
        } else {
            let targetIndex = myDeque.dequeList.index(of: target)
            if targetIndex <= myDeque.size - targetIndex {
                while target != myDeque.front! {
                    rotateClockwise()
                }
            } else {
                while target != myDeque.front! {
                    rotateCounterClockwise()
                }
            }
            myDeque.popFront()
        }
    }
    print(countOperations)
    
    
    func rotateClockwise() {
        guard let temp = myDeque.popFront() else { return }
        myDeque.pushBack(data: temp)
        countOperations += 1
    }
    
    func rotateCounterClockwise() {
        guard let temp = myDeque.popBack() else { return }
        myDeque.pushFront(data: temp)
        countOperations += 1
    }
}

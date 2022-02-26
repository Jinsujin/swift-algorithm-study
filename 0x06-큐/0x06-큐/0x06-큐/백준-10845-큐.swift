//
//  main.swift
//  백준-10845-큐
//
//  Created by 김상혁 on 2022/02/21.
//
import Foundation

struct Queue {
    var queue:[Int] = []
    
    var count: Int {
        return queue.count
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    mutating func push(data: Int) {
        queue.append(data)
    }
    
    mutating func pop() {
        if isEmpty() {
            print("-1")
        }
        else {
            let lastElement = queue.removeFirst()
            print(lastElement)
        }
    }
    
    func size() {
        print(queue.count)
    }
    
    func empty() {
        isEmpty() ? print("1") : print("0")
    }
    
    func front() {
        isEmpty() ? print("-1") : print(queue[0])
    }

    func back() {
        isEmpty() ? print("-1") : print(queue[count - 1])
    }
}

func solution10845() {
    var myQueue = Queue()
    
    let inputCount = Int(readLine()!)!
    
    for _ in 0..<inputCount {
        let command = readLine()!.components(separatedBy: " ")
        
        switch command[0] {
        case "push":
            myQueue.push(data: Int(command[1])!)
        case "pop":
            myQueue.pop()
        case "size":
            myQueue.size()
        case "empty":
            myQueue.empty()
        case "front":
            myQueue.front()
        case "back":
            myQueue.back()
        default:
            return
        }
    }
}

//
//  백준-10773-제로.swift
//  0x05-스택
//
//  Created by 김상혁 on 2022/02/12.
//

import Foundation

struct Element {
    let number: Int
}

struct Stack {
    var stack: [Element] = []
    var size: Int = 0

    func isEmpty() -> Bool {
        return size == 0
    }

    mutating func push(newNode: Element) {
        stack.append(newNode)
        size += 1
    }

    mutating func pop() {
        if isEmpty() {
            return
        }
        else {
            size -= 1
            stack.popLast()
        }
    }

    func peek() -> Element? {
        if isEmpty() {
            return nil
        }
        else {
            return stack.last
        }
    }
    
    func printSum() {
        print(stack.map{ $0.number }.reduce(0, +))
    }
}

func solution10773() {
    let inputCount = Int(readLine()!)!

    var stack = Stack()
    for _ in 0..<inputCount {
        let number = Int(readLine()!)!

        switch number {
        case 0:
            stack.pop()
        default:
            let newNumber = Element(number: number)
            stack.push(newNode: newNumber)
        }
    }
    stack.printSum()
}

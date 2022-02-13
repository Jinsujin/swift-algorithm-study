//
//  백준-9012-괄호.swift
//  0x05-스택
//
//  Created by 김상혁 on 2022/02/12.
//

import Foundation

struct Element {
    let bracket: String
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
}

func solution9012() {
    let inputCount = Int(readLine()!)!

    for _ in 0..<inputCount {
        let brackets = readLine()!
    
        var stack = Stack()
        
        brackets.map{ bracket in
        
            switch bracket {
            case "(":
                stack.push(newNode: Element(bracket: "("))
            
            case ")":
                stack.peek()?.bracket == "(" ?
                stack.pop() :
                stack.push(newNode: Element(bracket: ")"))
            
            default:
                return
            }
        }
        stack.isEmpty() ? print("YES") : print("NO")
    }
}

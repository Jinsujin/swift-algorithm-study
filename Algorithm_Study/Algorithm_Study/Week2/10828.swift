//
//  10828.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/02/12.
//

import Foundation

struct Stack {
    var stack = [Int]()
    
    var isEmpty: Bool { // "empty" 명령을 구현하기 위한 프로퍼티
        if stack.isEmpty {return true}
        return false
    }
    
    var size: Int { // "size" 명령을 구현하기 위한 프로퍼티
        return stack.count
    }
    
    var top: Int? { // "top" 명령을 구현하기 위한 프로퍼티
        return stack.last
    }
    
    mutating func push(_ newValue: Int) { // "push X" 명령을 구현하기 위한 메서드
        stack.append(newValue)
    }
    
    mutating func pop() -> Int? { // "pop" 명령을 구현하기 위한 메서드
        if stack.isEmpty { return nil }
        else {
            return stack.removeLast()
        }
    }
}

func mysolutionOf10828() {
    var myStack = Stack()
    
    let commandCount = Int(readLine()!.components(separatedBy: " ").first ?? "0") ?? 0
    
    for _ in 0..<commandCount {
        let currentCommand = readLine()!.components(separatedBy: " ")
        
        switch currentCommand.first! {
        case "push":
            let pushingValue = Int(currentCommand[1])!
            myStack.push(pushingValue)
        case "pop":
            guard let poppedValue = myStack.pop() else {
                print(-1)
                continue
            }
            print(poppedValue)
        case "size":
            print(myStack.size)
        case "empty":
            print(myStack.isEmpty == true ? 1 : 0)
        case "top":
            print(myStack.top != nil ? myStack.top! : -1)
        default:
            continue
        }
    }
}

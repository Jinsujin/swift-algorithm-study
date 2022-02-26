//
//  9012.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/02/12.
//

import Foundation

struct MyStack<T> {
    var stack = [T]()
    
    var isEmpty: Bool {
        if stack.isEmpty {return true}
        return false
    }
    
    var top: T? {
        return stack.last
    }
    
    mutating func push(_ newValue: T) {
        stack.append(newValue)
    }
    
    mutating func pop() -> T? {
        if stack.isEmpty { return nil }
        else {
            return stack.removeLast()
        }
    }
}
func mySolutionOf9012() {
    let caseCount = Int(readLine()!.components(separatedBy: " ").first ?? "0") ?? 0
    
    for _ in 0..<caseCount {
        var stack = MyStack<Character>()
        var parenthesisString = readLine()!
        while !parenthesisString.isEmpty {
            if stack.isEmpty {stack.push(parenthesisString.removeFirst())}
            else if stack.top == "(" && parenthesisString.first! == ")" {
                stack.pop()
                parenthesisString.removeFirst()
            }
            else {stack.push(parenthesisString.removeFirst())}
        }
        if stack.isEmpty {print("YES")}
        else {print("NO")}
    }
}

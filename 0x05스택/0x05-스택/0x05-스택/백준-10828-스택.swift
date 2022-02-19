//
//  백준-10828-스택.swift
//  0x05-스택
//
//  Created by 김상혁 on 2022/02/12.
//

import Foundation

struct Element {
    let data: Int
}

struct Stack {
    var stack: [Element] = []
    var size: Int = 0

    func isEmpty() -> Bool {
        return size == 0
    }


    //push X: 정수 X를 스택에 넣는 연산이다.
    mutating func push(newNode: Element) {
        stack.append(newNode)
        size += 1
    }


    //pop: 스택에서 가장 위에 있는 정수를 빼고, 그 수를 출력한다.
    //     만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
    mutating func pop() {
        if isEmpty() {
            print("-1")
        }
        else {
            guard let topElement = stack.popLast() else { return }
            print(topElement.data)
            size -= 1
        }


    }


    //size: 스택에 들어있는 정수의 개수를 출력한다.
    func printSize() {
        print(self.size)
    }


    //empty: 스택이 비어있으면 1, 아니면 0을 출력한다.
    func printIsEmpty() {
        isEmpty() ? print("1") : print("0")
    }


    //top: 스택의 가장 위에 있는 정수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
    func peek() {
        if isEmpty() {
            print("-1")
        }
        else {
            guard let topElement = stack.last else { return }
            print("\(topElement.data)")
        }
    }
}


func solution10828() {
    var stack = Stack()

    let inputCount = Int(readLine()!)!

    for _ in 0..<inputCount {
        let command = readLine()!.split(separator: " ")

        switch command[0] {
        case "push":
            let newNode = Element(data: Int(command[1])!)
            stack.push(newNode: newNode)
        case "pop":
            stack.pop()
        case "size":
            stack.printSize()
        case "empty":
            stack.printIsEmpty()
        case "top":
            stack.peek()
        default:
            return
        }
    }
}

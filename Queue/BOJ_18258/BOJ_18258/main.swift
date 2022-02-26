//
//  main.swift
//  BOJ_18258
//
//  Created by 박진섭 on 2022/02/19.
//

import Foundation

let fileIO = FileIO()

let firstInput = fileIO.readInt()

var Queue:[Int] = []

var head:Int = 0
var tail:Int = 0

var count = 0

func push(_ int:Int) {
    Queue.append(int)
    tail += 1
}


func pop() {
    if Queue.count > head {
        print(Queue[head])
        head += 1
    } else {
        print(-1)
    }
}

func size() {
    tail - head >= 0 ? print(tail - head) : print(0)
}


func empty() {
    tail - head == 0 ? print(1) : print(0)
}

func front() {
    if Queue.count > head {
        print(Queue[head])
    } else {
        print(-1)
    }
}

func back() {
    if Queue.count > head {
        print(Queue[tail - 1])
    } else {
        print(-1)
    }
}

while count < firstInput {

    let input = readLine()!.split(separator: " ")
    let method = input[0]
    let number = input.count == 2 ? Int(input[1])! : nil

    switch method {
        case "push": push(number!)
        case "pop": pop()
        case "size": size()
        case "empty": empty()
        case "front": front()
        case "back": back()

        default: print("")
    }
    count += 1
}

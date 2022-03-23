//
//  5397_키로거.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/05.
//

import Foundation

//func p5397() {
//    for _ in 0..<Int(readLine()!)! {
//        let list = LinkedList<Any>()
//        var cursor = 0
//        var input = readLine()!.map{$0}
//        while !input.isEmpty {
//            let target = input.removeFirst()
//            switch target {
//            case "<" :
//                if cursor - 1 >= 0 {
//                    cursor -= 1
//                }
//            case ">":
//                if cursor + 1 <= list.size()+1 {
//                    cursor += 1
//                }
//            case "-":
//                list.delete(Index: cursor-1)
//                cursor -= 1
//            default :
//                list.insert(data: target, index: cursor)
//                cursor += 1
//            }
//        }
//        print(list.listToString())
//    }
//}

func p5397() {
    for _ in 0..<Int(readLine()!)! {
        var fromFirst = ""
        var fromLast = ""
        var command = Array(readLine()!)
        for target in command {
            switch target {
            case "<":
                if !fromFirst.isEmpty {
                    fromLast.append(fromFirst.removeLast())
                }
            case ">":
                if !fromLast.isEmpty {
                    fromFirst.append(fromLast.removeLast())
                }
            case "-":
                if !fromFirst.isEmpty{
                    fromFirst.removeLast()
                }
            default:
                fromFirst.append(target)
            }
        }
        print(fromFirst + fromLast.reversed())
    }
}

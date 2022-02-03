//
//  1406_에디터.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/03.
//

import Foundation

//func p1406() {
//    let stringList = LinkedList<Any>()
//    let input = Array(readLine()!).map{stringList.append(data:$0)}
//    var cursor = input.count-1
//    var length = cursor
//    for _ in 0..<Int(readLine()!)! {
//        let command = readLine()!.components(separatedBy: " ")
//        switch command[0] {
//        case "L":
//            if cursor-1 >= 0 {
//                cursor -= 1
//            }
//        case "D":
//            if cursor + 1 <= length {
//                cursor += 1
//            }
//        case "B":
//            if cursor-1 >= 0 {
//            stringList.delete(Index: cursor)
//                cursor -= 1
//                length -= 1
//            }
//        case "P":
//            stringList.insert(data: command[1], index: cursor)
//            cursor += 1
//            length += 1
//        default:
//            return
//        }
//    }
//    print(stringList.listToString())
//}


//func p1406() {
//    let input = Array(readLine()!).map{String($0)}
//    var cursor = input.count
//    var length = cursor
//    var stringList : [String] = []
//    input.forEach{stringList.append($0)}
//    for _ in 0..<Int(readLine()!)! {
//        let command = readLine()!.components(separatedBy: " ")
//        switch command[0] {
//        case "L":
//            if cursor-1 >= 0 {
//                cursor -= 1
//            }
//        case "D":
//            if cursor + 1 <= length {
//                cursor += 1
//            }
//        case "B":
//            if cursor-1 >= 0{
//            stringList.remove(at: cursor-1)
//                cursor -= 1
//                length -= 1
//            }
//        case "P":
//            stringList.insert(command[1], at: cursor)
//            cursor += 1
//            length += 1
//        default:
//            return
//        }
//    }
//    print(stringList.joined())
//}
func p1406() {
    var fromFirst = readLine()!
    var fromLast = ""
    for _ in 0..<Int(readLine()!)! {
        let command = readLine()!
        switch command {
        case "L":
            if !fromFirst.isEmpty {
                fromLast.append(fromFirst.removeLast())
            }
        case "D":
            if !fromLast.isEmpty {
                fromFirst.append(fromLast.removeLast())
            }
        case "B":
            if !fromFirst.isEmpty{
                fromFirst.removeLast()
            }
        default:
            fromFirst.append(command.last!)
        }
    }
    print(fromFirst + fromLast.reversed())
}

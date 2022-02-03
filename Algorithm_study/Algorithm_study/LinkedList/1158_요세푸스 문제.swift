//
//  1158_요세푸스 문제.swift
//  Algorithm_study
//
//  Created by dale on 2022/01/30.
//

import Foundation


func p1158() {
    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let n = input[0], k = input[1]-1
    let list = LinkedList<Any>()
    (1...n).forEach{list.append(data: $0)}
    var result : [String] = []
    (1...n).forEach{_ in
        let targetNode = list.pop(Index: k)
        list.head = targetNode?.next
        result.append(String(describing: targetNode!.data!))
    }
    print("<\(result.joined(separator: ", "))>")
}

//func p1158() {
//    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
//    var array = Array(1...input[0])
//    var index = 0, result = "<"
//    while array.count != 1 {
//        index = (index + input[1] - 1) % array.count
//        result +=  String(array.remove(at:index)) + ", "
//    }
//    result += String(array[0]) + ">"
//    print(result)
//}

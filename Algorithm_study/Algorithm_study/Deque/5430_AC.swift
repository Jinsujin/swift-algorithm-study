//
//  5430_AC.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/26.
//

import Foundation

func p5430() {
    for _ in 0..<Int(readLine()!)! {
        let command = Array(readLine()!)
        let count = Int(readLine()!)!
        var result = true
        var reverse = false
        let deque = (readLine()!.dropFirst().dropLast()).components(separatedBy: ",")
        var head = 0
        var tail : Int = count - 1
        for c in command {
            switch c {
            case "R":
                reverse.toggle()
            case "D":
                if head > tail {
                    result = false
                    break
                }
                if reverse {
                    tail -= 1
                }else {
                    head += 1
                }
            default:
                break
            }
        }
        var temp = ""
        if !result {
            temp = "error"
        }else if head > tail {
            temp = "[]"
        }else if reverse {
            temp = deque[head...tail].reversed().joined(separator: ",")
            temp = "[\(temp)]"
        }else {
            temp = deque[head...tail].joined(separator: ",")
            temp = "[\(temp)]"
        }
        print(temp)
    }
}

//
//  2448_별찍기11.swift
//  Algorithm_study
//
//  Created by dale on 2022/03/26.
//

import Foundation
func p2448() {
    let n = Int(readLine()!)!
    let triangle = recursive(3, ["*","* *","*****"])
    
    for i in 0..<triangle.count {
        let front = String(repeating: " ", count: n-1-i)
        print("\(front)\(triangle[i])\(front)")
    }
    func recursive(_ m: Int, _ triangle: [String]) -> [String]{
        if m == n {
            return triangle
        }
        var temp : [String] = triangle
        var count = m*2-1
        for i in 0..<triangle.count {
            let blank : String = String(repeating: " ", count: count)
            count -= 2
            temp.append("\(triangle[i])\(blank)\(triangle[i])")
        }
        return recursive(2 * m, temp)
    }
}

//
//  2447_별찍기10.swift
//  Algorithm_study
//
//  Created by dale on 2022/03/27.
//

import Foundation

func p2447() {
    let n = Int(readLine()!)!
    recursive(3, ["***","* *","***"]).forEach{print($0)}
    func recursive(_ m: Int,_ string: [String]) -> [String] {
        if m == n {
            return string
        }
        let blank = String(repeating: " ", count: m)
        let center : [String] = string.map{$0 + blank + $0}
        let temp : [String] = string.map{$0 + $0 + $0}
        let result = temp + center + temp
        return recursive(m*3, result)
    }
}


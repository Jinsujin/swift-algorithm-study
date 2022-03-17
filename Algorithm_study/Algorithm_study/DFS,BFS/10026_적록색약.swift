//
//  10026_적록색약.swift
//  Algorithm_study
//
//  Created by dale on 2022/03/12.
//

import Foundation

func p10026() {
    let n = Int(readLine()!)!
    var originMap : [[String]] = []
    var secondMap : [[String]] = []
    var originVisit = Array(repeating: Array(repeating: false, count: n), count: n)
    var secondVisit = originVisit
    for _ in 0..<n {
        originMap.append(Array(readLine()!).map{String($0)})
    }
    
    for i in originMap {
        var temp : [String] = []
        for j in i {
            if j == "R" {
                temp.append("G")
            }else {
                temp.append(j)
            }
        }
        secondMap.append(temp)
    }
    
    let isInMap : (Int,Int) -> Bool = { (nextX,nextY) in
        return nextX >= 0 && nextY >= 0 && nextX < n && nextY < n
    }

    let dx = [0,0,1,-1], dy = [1,-1,0,0]
    var originResult = 0
    var secondResult = 0
    for y in 0..<n {
        for x in 0..<n {
            if !originVisit[y][x]{
                originResult += 1
                originDfs(start: (x,y))
            }
            if !secondVisit[y][x]{
                secondResult += 1
                secondDfs(start: (x,y))
            }
        }
    }
    
    print(originResult)
    print(secondResult)
    
    func originDfs(start: (Int,Int)) {
        let x = start.0
        let y = start.1
        originVisit[y][x] = true
        for direction in 0..<4 {
            let nextX = x + dx[direction]
            let nextY = y + dy[direction]
            if  isInMap(nextX,nextY) && !originVisit[nextY][nextX] && originMap[y][x] == originMap[nextY][nextX]{
                originDfs(start: (nextX,nextY))
            }
        }
    }
    
    func secondDfs(start: (Int,Int)) {
        let x = start.0
        let y = start.1
        secondVisit[y][x] = true
        for direction in 0..<4 {
            let nextX = x + dx[direction]
            let nextY = y + dy[direction]
            if  isInMap(nextX,nextY) && !secondVisit[nextY][nextX] && secondMap[y][x] == secondMap[nextY][nextX]{
                secondDfs(start: (nextX,nextY))
            }
        }
    }
}


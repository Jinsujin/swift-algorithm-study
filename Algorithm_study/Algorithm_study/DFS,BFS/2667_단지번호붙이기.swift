//
//  2667_단지번호붙이기.swift
//  Algorithm_study
//
//  Created by dale on 2022/03/22.
//

import Foundation

func p2667() {
    let n = Int(readLine()!)!
    var map : [[Int]] = []
    var visited : [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    for _ in 0..<n {
        map.append(Array(readLine()!).map{Int(String($0))!})
    }
    var total : Int = 0
    
    var estate : [Int] = []
    
    let isInMap : (Int,Int) -> Bool = { (nextX,nextY) in
        return nextX >= 0 && nextY >= 0 && nextX < n && nextY < n
    }
    
    let ways = [(x: 1, y: 0), (x: -1, y: 0), (x: 0, y: 1), (x:0, y: -1)]
    
    for y in 0..<n {
        for x in 0..<n {
            if !visited[y][x] && map[y][x] == 1 {
                estate.append(dfs(x: x, y: y))
                total += 1
            }
            
        }
    }
    print(total)
    estate.sort()
    estate.forEach{print($0)}
    func dfs(x: Int, y: Int) -> Int{
        var estateCount = 1
        visited[y][x] = true
        for direction in ways {
            let nextX = x + direction.x
            let nextY = y + direction.y
            if isInMap(nextX,nextY) && !visited[nextY][nextX] && map[nextY][nextX] == 1{
                estateCount += dfs(x: nextX, y: nextY)
            }
        }
        return estateCount
    }
}

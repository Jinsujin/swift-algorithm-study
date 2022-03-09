//
//  2178_미로탐색.swift
//  Algorithm_study
//
//  Created by dale on 2022/03/09.
//

import Foundation

func p2178() {
    let inputNM = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let n = inputNM[0]
    let m = inputNM[1]
    
    var map : [[Int]] = []
    for _ in 0..<n {
        map.append(Array(readLine()!).map{Int(String($0))!})
    }
    
    var visit = Array(repeating: [Bool](repeating: false, count: m), count: n)
    visit[0][0] = true
    
    var distance = Array(repeating: Array(repeating: 1, count: m), count: n)
    
    var queue: [(Int, Int)] = [(0, 0)]
    
    let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
    
    let isInMap : (Int,Int) -> Bool = { (nextX,nextY) in
        return nextX >= 0 && nextY >= 0 && nextX < n && nextY < m
    }
    let isMoveAble : (Int,Int) -> Bool = {(nextX,nextY) in
        return !visit[nextX][nextY] && map[nextX][nextY] == 1
    }
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let x = current.0
        let y = current.1
        for direction in 0..<4 {
            let nextX = x + dx[direction]
            let nextY = y + dy[direction]
            
            if isInMap(nextX,nextY) && isMoveAble(nextX,nextY) {
                distance[nextX][nextY] = distance[x][y] + 1
                visit[nextX][nextY] = true
                queue.append((nextX,nextY))
            }
        }
    }
    print(distance[n-1][m-1])
}

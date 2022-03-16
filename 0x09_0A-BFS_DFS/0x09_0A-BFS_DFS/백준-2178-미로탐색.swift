//
//  백준-2178-미로탐색.swift
//  0x09_0A-BFS_DFS
//
//  Created by 김상혁 on 2022/03/14.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0]
let M = input[1]

var maze = Array(repeating: Array(repeating: 0, count: M), count: N)

for i in 0..<N {
    let input = readLine()!.map{ Int(String($0))! }
    
    for j in 0..<input.count {
        maze[i][j] = input[j]
    }
}

func bfs(start: (x: Int, y: Int)) {
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    var queue = [start]
    
    let directionX = [0, 0, 1, -1]
    let directionY = [-1, 1, 0, 0]
    
    var visitedCount = Array(repeating: Array(repeating: 0, count: M), count: N)
    visitedCount[start.x][start.y] = 1
    
    while !queue.isEmpty {
        let node = queue.first!
        
            for i in 0..<4 {
                let nextX = node.x + directionX[i]
                let nextY = node.y + directionY[i]
                
                if nextX < 0 || nextX >= N || nextY < 0 || nextY >= M {
                    continue //범위 벗어나면 continue
                }
                
                if maze[nextX][nextY] == 1 && !visited[nextX][nextY] {
                    queue.append((nextX, nextY))
                    visited[nextX][nextY] = true
                    visitedCount[nextX][nextY] += visitedCount[node.x][node.y] + 1
                }
            }
        queue.removeFirst()
    }
    
    print(visitedCount.last!.last!)
}

bfs(start: (0, 0))

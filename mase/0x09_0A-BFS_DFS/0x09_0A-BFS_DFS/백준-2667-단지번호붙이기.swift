//
//  백준-2667-단지번호붙이기.swift
//  0x09_0A-BFS_DFS
//
//  Created by 김상혁 on 2022/03/19.
//

import Foundation

let directionX = [0, 1, 0, -1]
let directionY = [-1, 0, 1, 0]

let N = Int(readLine()!)! //지도 크기 (N x N)
var blocks = Array(repeating: Array(repeating: 0, count: N), count: N)

for i in 0..<N {
    let input = readLine()!.map { Int(String($0))! }
    blocks[i] = input
}

//(0,0) 부터 탐색
//0 이라면, pass
//1 이라면, 그 자리에서 DFS 시작한다
//더 이상 갈 곳이 없을 때 까지 DFS를 반복하며, 반복할 때 마다 count를 센다


func DFS(start: (x: Int, y: Int)) -> Int {
    var stack = [start]
    
    blocks[start.x][start.y] = 0 //방문했다고 처리
    var count = 1
    
    while !stack.isEmpty {
        let current = stack.removeLast()
        
        for i in 0..<4 {
            let nextX = current.x + directionX[i]
            let nextY = current.y + directionY[i]
            
            if nextX < 0 || nextX >= N || nextY < 0 || nextY >= N {
                continue //범위 벗어나면 continue
            }
            
            if blocks[nextX][nextY] == 1 { //갈 수 있으면
                blocks[nextX][nextY] = 0 //0으로 만들고
                stack.append((nextX, nextY)) //스택에 추가
                count += 1
            }
        }
    }
    
    return count
}

var numberOfBlocks = 0
var eachBlockCount = [Int]()

for i in 0..<N {
    for j in 0..<N {
        if blocks[i][j] == 1 {
            eachBlockCount.append(DFS(start: (i, j)))
            numberOfBlocks += 1
        }
    }
}

print(numberOfBlocks)
eachBlockCount.sorted().map{ print($0) }

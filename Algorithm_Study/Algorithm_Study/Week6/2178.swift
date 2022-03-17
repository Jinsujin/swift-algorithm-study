//
//  2178.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/03/13.
//

import Foundation

func mySolutionOf2178() {
    
    func bfs(graph: [[Int]], N: Int, M: Int) -> Int {
        var graph = graph
        var distance = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
        distance[0][0] = 1
        var toVisitQueue = [(x: 0, y: 0)]
        
        while !toVisitQueue.isEmpty {
            let position = toVisitQueue.removeFirst()
            
            for i in [(x: 1, y: 0), (x: -1, y: 0), (x: 0, y: 1), (x: 0, y: -1)] {
                let (dx, dy) = (position.x + i.x, position.y + i.y) // nextPosition = (dx, dy)
                
                if (0..<N).contains(dy) && (0..<M).contains(dx) && graph[dy][dx] == 1 { // dx, dy가 그래프 내의 좌표이고, 그래프 상 (dx,dy)가 1인 경우
                    graph[dy][dx] = 0
                    toVisitQueue.append((dx, dy))
                    distance[dy][dx] = distance[position.y][position.x] + 1
                }
            }
        }
        
        return distance[N-1][M-1]
    }
    
    var maze = [[Int]]()
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0], M = input[1]
    
    for _ in 0..<N { // maze 만들기
        maze.append(readLine()!.map{Int(String($0))!})
    }
    
    print(bfs(graph: maze, N: N, M: M))
}

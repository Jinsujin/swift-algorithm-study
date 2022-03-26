//
//  2667.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/03/19.
//

import Foundation

func mySolutionOf2667() {
    
    let N = Int(readLine()!)!
    var _map = [[Int]]()
    var complexes = [Int]()
    
    for _ in 0..<N {
        _map.append(readLine()!.map{Int(String($0))!})
    }
    
    for y in 0..<N {
        for x in 0..<N {
            if _map[y][x] == 1 {
                complexes.append(bfs(x: x, y: y))
            }
        }
    }
    
    print(complexes.count)
    complexes.sorted()
        .forEach {print($0)}
    
    func bfs( x:Int, y: Int) -> Int {
        var homeCount = 1
        var toVisitQueue = [(x: x, y: y)]
        _map[y][x] = 0
        
        while !toVisitQueue.isEmpty {
            let currentPosition = toVisitQueue.removeFirst()
            
            for d in [(x: 1, y: 0), (x: -1, y: 0), (x: 0, y: 1), (x: 0, y: -1)] {
                let (nextX, nextY) = (currentPosition.x + d.x, currentPosition.y + d.y)
                
                if (0..<N).contains(nextX) && (0..<N).contains(nextY) && _map[nextY][nextX] == 1 {
                    homeCount += 1
                    _map[nextY][nextX] = 0
                    toVisitQueue.append((nextX, nextY))
                }
            }
        }
        
        return homeCount
    }
}

func mySolutionOf2667_2() {
    let N = Int(readLine()!)!
    var _map = [[Int]]()
    var complexes = [Int]()
    
    for _ in 0..<N {
        _map.append(readLine()!.map{Int(String($0))!})
    }
    
    for y in 0..<N {
        for x in 0..<N {
            if _map[y][x] == 1 {
                complexes.append(dfs(x: x, y: y))
            }
        }
    }
    
    print(complexes.count)
    complexes.sorted()
        .forEach {print($0)}
    
    func dfs( x:Int, y: Int) -> Int {
        var homeCount = 1
        _map[y][x] = 0
        
            for d in [(x: 1, y: 0), (x: -1, y: 0), (x: 0, y: 1), (x: 0, y: -1)] {
                let (nextX, nextY) = (x + d.x, y + d.y)
                
                if (0..<N).contains(nextX) && (0..<N).contains(nextY) && _map[nextY][nextX] == 1 {
                    _map[nextY][nextX] = 0
                    homeCount += dfs(x: nextX, y: nextY)
                }
            }
        
        return homeCount
    }
}

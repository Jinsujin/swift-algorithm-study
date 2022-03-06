//
//  Bfs.swift
//  Algorithm_study
//
//  Created by dale on 2022/03/06.
//

import Foundation

struct BFS {
    var graph: [Int: [Int]]
    var start: Int
    
    func find() -> [Int] {
        var visitedQueue: [Int] = []
        var needVisitQueue: [Int] = [self.start]
        
        while !needVisitQueue.isEmpty {
            let node: Int = needVisitQueue.removeFirst()
            if visitedQueue.contains(node) {continue}
            visitedQueue.append(node)
            needVisitQueue += graph[node]?.sorted(by: <) ?? []
        }
        return visitedQueue
    }
}

//
//  DFS.swift
//  Algorithm_study
//
//  Created by dale on 2022/03/06.
//

import Foundation

struct DFS {
    var graph: [Int:[Int]]
    var start: Int
    func find() -> [Int] {
        var visitedQueue: [Int] = []
        var needVisitStack: [Int] = [self.start]
        while !needVisitStack.isEmpty {
            let node = needVisitStack.removeLast()
            if visitedQueue.contains(node) {continue}
            visitedQueue.append(node)
            needVisitStack += graph[node]?.sorted(by: >) ?? []
        }
        return visitedQueue
    }
}

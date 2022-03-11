//
//  1260_DFS와BFS.swift
//  Algorithm_study
//
//  Created by dale on 2022/03/06.
//

import Foundation

func p1260() {
    var graph : [Int:[Int]] = [:]
    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
    for i in 1...input[0] {
        graph[i] = []
    }
    for _ in 0..<input[1] {
        let branch = readLine()!.components(separatedBy: " ").map{Int($0)!}
        graph[branch[0]]!.append(branch[1])
        graph[branch[1]]!.append(branch[0])
        graph[branch[0]]!.sort()
        graph[branch[1]]!.sort()
    }
    let start = Int(input[2])
    let dfs = DFS(graph: graph, start: start)
    let result = dfs.find()
    let bfs = BFS(graph: graph, start: start)
    let bfsResult = bfs.find()
    print(result.map{String($0)}.joined(separator: " "))
    print(bfsResult.map{String($0)}.joined(separator: " "))
}

//
//  1260.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/03/06.
//

import Foundation

func mySolutionOf1260() {
    var graph = [Int : [Int]]()
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let numberOfLines = input[1]
    let startNode = input[2]
    
    for _ in 0..<numberOfLines {
        let connectedNodeInfo = readLine()!.split(separator: " ").map{ Int($0)! }
        if graph.keys.contains(connectedNodeInfo[0]) {
            var targetValue = graph[connectedNodeInfo[0]]!
            targetValue.append(connectedNodeInfo[1])
            graph.updateValue(targetValue, forKey: connectedNodeInfo[0])
        } else {
            graph.updateValue([connectedNodeInfo[1]], forKey: connectedNodeInfo[0])
        }
        
        if graph.keys.contains(connectedNodeInfo[1]) {
            var targetValue = graph[connectedNodeInfo[1]]!
            targetValue.append(connectedNodeInfo[0])
            graph.updateValue(targetValue, forKey: connectedNodeInfo[1])
        } else {
            graph.updateValue([connectedNodeInfo[0]], forKey: connectedNodeInfo[1])
        }
    }
    
    func bfsSearch(_ searchingTarget: [Int: [Int]], start: Int = startNode) -> [Int] {
        var toVisitQueue = [start]
        var visitedQueue = [Int]()
        
        
        while !toVisitQueue.isEmpty {
            let node = toVisitQueue.removeFirst()
            
            if visitedQueue.contains(node) {continue}
            
            visitedQueue.append(node)
            toVisitQueue += searchingTarget[node]?.sorted(by: <) ?? []
        }
        
        return visitedQueue
    }
    
    func dfsSearch(_ searchingTarget: [Int: [Int]], start: Int = startNode) -> [Int] {
        var toVisitStack = [start]
        var visitiedQueue = [Int]()
        
        while !toVisitStack.isEmpty {
            let node = toVisitStack.removeLast()
            
            if visitiedQueue.contains(node) {continue}
            
            visitiedQueue.append(node)
            toVisitStack += searchingTarget[node]?.sorted(by: >) ?? []
        }
        
        return visitiedQueue
    }
    
    print(String(Array(dfsSearch(graph).reduce("") {
        String($0) + " " + String($1)
    })[1...]))
    print(String(Array(bfsSearch(graph).reduce("") {
        String($0) + " " + String($1)
    })[1...]))
}

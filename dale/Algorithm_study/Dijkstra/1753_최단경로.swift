//
//  1753_최단경로.swift
//  Algorithm_study
//
//  Created by dale on 2022/04/02.
//

import Foundation

func p1753() {
    let fi = FileIO()
    let inf = 1000000
    let V = fi.readInt()
    let e = fi.readInt()
    let start = fi.readString()
    var graph : [String: [String:Int]] = [:]
    for i in 1...V {
        graph.updateValue([:], forKey: "\(i)")
    }
    for _ in 0..<e {
        let u = fi.readString()
        let v = fi.readString()
        let w = fi.readInt()
        graph[u]!.updateValue(w, forKey: v)
    }
    let result = dijkstra()
    var resultString = ""
    for i in 1...V {
        let distance = result["\(i)"]!
        resultString.write(distance == inf ? "INF" : "\(distance)")
        if i != V {
            resultString += "\n"
        }
    }
    print(resultString)
    func dijkstra() -> [String: Int]{
        var distances: [String: Int] = [:]
        for key in graph.keys {
            let value = key == start ? 0 : inf
            distances.updateValue(value, forKey: key)
        }
        graph[start]![start] = 0
        var queue:[(String,Int)] = [(start, graph[start]![start]!)]
        while queue.count != 0 {
            let node = queue.removeLast()
            let currentNode = node.0
            let currentDistance = node.1
            if distances[currentNode]! < currentDistance {
                continue
            }
            
            for node in graph[currentNode]! {
                let distance = currentDistance + node.value
                if distance < distances[node.key]! {
                    distances[node.key] = distance
                    queue.append((node.key, distance))
                }
            }
        }
        return distances
    }
}




//
//  백준-1260-DFS와BFS.swift
//  0x09_0A-BFS_DFS
//
//  Created by 김상혁 on 2022/03/10.
//

import Foundation

struct Queue {
    var queue: [Int] = []

    func isEmpty() -> Bool {
        return queue.isEmpty
    }

    mutating func enqueue(data: Int) {
        queue.append(data)
    }

    mutating func dequeue() -> Int {
        if isEmpty() {
            return -1
        }

        return queue.removeFirst()
    }
}

func solution() {
    
    func DFS(graph: [[Int]], vertex: Int, visited: inout [Bool]) {
        visited[vertex] = true
        print(vertex, terminator: " ")

        for i in graph[vertex] {
            if !visited[i] {
                DFS(graph: graph, vertex: i, visited: &visited)
            }
        }
    }

    func BFS(graph: [[Int]], vertex: inout Int, visited: inout [Bool]) {
        visited[vertex] = true
        queue.enqueue(data: vertex)
        
        while !queue.isEmpty() {
            vertex = queue.dequeue()
            print(vertex, terminator: " ")
            
            for i in graph[vertex] {
                if !visited[i] {
                    queue.enqueue(data: i)
                    visited[i] = true
                }
            }
        }
    }
    
    let inputs = readLine()!.components(separatedBy: " ").map{ Int($0)! }

    let vertexCount = inputs[0]
    let edgeCount = inputs[1]
    var rootNode = inputs[2]

    var queue = Queue()
    var graph = [[Int]](repeating: [], count: vertexCount + 1)
    var visited = [Bool](repeating: false, count: vertexCount + 1)

    for _ in 1...edgeCount {
        let connectedVertexs = readLine()!.components(separatedBy: " ").map{ Int($0)! }

        graph[connectedVertexs[0]].append(connectedVertexs[1])
        graph[connectedVertexs[1]].append(connectedVertexs[0])

        graph[connectedVertexs[0]].sort()
        graph[connectedVertexs[1]].sort()
    }
    
    DFS(graph: graph, vertex: rootNode, visited: &visited)

    print("")
    visited = [Bool](repeating: false, count: vertexCount + 1)

    BFS(graph: graph, vertex: &rootNode, visited: &visited)

}

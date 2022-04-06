//
//  BOJ_1260_DFS와BFS.swift
//  swiftAlgorithm
//
//  Created by 최예주 on 2022/04/01.
//

import Foundation



// BOJ_1260_DFS와BFS

/*
 첫째 줄에 정점의 개수 N(1 ≤ N ≤ 1,000), 간선의 개수 M(1 ≤ M ≤ 10,000),
 탐색을 시작할 정점의 번호 V가 주어진다.
 다음 M개의 줄에는 간선이 연결하는 두 정점의 번호가 주어진다.
 어떤 두 정점 사이에 여러 개의 간선이 있을 수 있다. 입력으로 주어지는 간선은 양방향이다.
 
 첫째 줄에 DFS를 수행한 결과를, 그 다음 줄에는 BFS를 수행한 결과를 출력한다.
 V부터 방문된 점을 순서대로 출력하면 된다.
 */

func solBOJ_1260(){
    

    // 깊이우선탐색
    func dfs(_ graph: [[Int]], _ v: Int, _ visited: inout [Bool]) {
        visited[v] = true // 방문처리
        
        print(v, terminator: " ")
        
        for node in graph[v]{
            if visited[node] == false{ // 아직 방문을 안한 노드가 있다면 방문
                dfs(graph, node, &visited)
            }
        }
    }

    func bfs(_ graph: [[Int]], _ v: Int, _ visited: inout [Bool]){
        var visitQueue = Queue<Int>()
        
        visitQueue.enqueue(v)
        visited[v] = true
        
        while visitQueue.isEmpty == false { // 방문할 노드가 있다면 계속 탐색
            guard let node = visitQueue.dequeue() else { return }
            print(node, terminator: " ")
            for node in graph[node]{
                if visited[node] == false{
                    visitQueue.enqueue(node)
                    visited[node] = true
                }
            }
        }
    }

    struct Queue<T> {
        var arr = [T]()
        
        mutating func enqueue(_ element: T){
            arr.append(element)
        }
        mutating func dequeue() -> T? {
            if arr.isEmpty{
                return nil
            } else {
                return arr.removeFirst()
            }
        }
        
        var isEmpty: Bool {
            return arr.isEmpty
        }
    }


    let input = readLine()!.split(separator: " ").map { num in
        return Int(num)!
    }

    let n = input[0]
    let m = input[1]
    let v = input[2]

    var graph: [[Int]] = Array(repeating: [], count: n+1)
    var visited = Array(repeating: false, count: n+1)

    for _ in 1...m {
        let input: [Int] = readLine()!.split(separator: " ").map { num in
            return Int(num)!
        }
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
        graph[input[0]].sort()
        graph[input[1]].sort()
        
    }

    dfs(graph, v, &visited)

    print("")
    visited = Array(repeating: false, count: n+1)
    bfs(graph, v, &visited)


}

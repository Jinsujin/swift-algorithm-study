//
//  main.swift
//  BOJ_1260_DFS,BFS
//
//  Created by 박진섭 on 2022/03/06.
//

import Foundation

let firstinput = readLine()!.split(separator: " ").map({ Int($0)! })

let n = firstinput[0]
let m = firstinput[1]
let v = firstinput[2]

var graph:[[Int]] = Array(repeating: [], count: n + 1) //graph[0] 시작 graph[1] 도착

//그래프 만들기
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let start = input[0]      //1 ,1 ,1 ,2 ,3
    let end = input[1]        //2 ,3 ,4 ,4 ,4
    
    graph[start].append(end)        //1 2 , 1 3, 1 4, 2 4, 3 4
    graph[end].append(start)        //2 1 , 3 1, 4 1 , 4 2 , 4 3
     
    graph[start].sort()
    graph[end].sort()
    print(graph)
}

/*
1 2
1 3
1 4
2 4
3 4

 [
 []
 [2,3,4]
 [1,1,4]
 [1,4]
 [1,2,3]
 ]
 
 */

//방문유무 배열
var visited:[Bool] = Array(repeating: false, count: n + 1)

func dfs(_ start:Int) {
    //현재 정점 방문기록
    visited[start] = true
    
    print(start,terminator: " ")
    
    for i in graph[start] {
        if visited[i] == false {
            dfs(i)
        }
    }
    
}


func bfs(_ start:Int) {
    var queue: [Int] = [start]          //시작점은 미리 넣어둔다.
    
    visited[start] = true
    
    while queue.isEmpty == false {
        let willRemoveNode = queue.removeFirst()
        
        print(willRemoveNode,terminator: " ")
        
        for i in graph[willRemoveNode] {
            if !visited[i] {
                queue.append(i)
                visited[i] = true
                print(queue)
            }
        }
    }
}


dfs(v)
print()
visited = Array(repeating: false, count: n+1) // 배열 초기화
bfs(v)

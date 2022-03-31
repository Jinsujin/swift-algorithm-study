
import Foundation

/*
101111
101010
101011
111011
*/

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var dx = [1,-1,0,0]
var dy = [0,0,1,-1]

var maze = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n{
    let input = readLine()!.map { Int(String($0))! }
    for j in 0..<m {
        maze[i][j] = input[j]
    }
}

func bfs(start: (x:Int, y:Int)) {
    var visisted = Array(repeating: Array(repeating: false, count: m), count: n)
    var queue = [start]

    let dx = [0,0,1,-1]
    let dy = [-1,1,0,0]

    var visitedCount = Array(repeating: Array(repeating: 0, count: m), count: n)
    visitedCount[start.x][start.y] = 1

    while !queue.isEmpty {
        let node = queue.first!

        for i in 0..<4 {
            let nX = node.x + dx[i]
            let nY = node.y + dy[i]

            if nX < 0 || nX >= n || nY < 0 || nY >= m {
                continue
            }
            if maze[nX][nY] == 1 && !visisted[nX][nY] {
                queue.append((nX,nY))
                visisted[nX][nY] = true
                visitedCount[nX][nY] += visitedCount[node.x][node.y] + 1
                print(visitedCount)
        }
            
    }
    print(queue)
    queue.removeFirst()
//    print(visitedCount[n - 1][m - 1])
    }
}

bfs(start: (0, 0))

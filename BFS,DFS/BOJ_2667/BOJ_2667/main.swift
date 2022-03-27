import Foundation

typealias adj = (row:Int, col:Int)
let adjs:[adj] = [(1,0),(-1,0),(0,1),(0,-1)]

let mapSize = Int(readLine()!)!
var map = [[Int]]()

var apartCount:Int = 0
var aparts:[Int] = []
var visited = Array(repeating: Array(repeating: false, count: mapSize), count: mapSize)

//make map
for _ in 0..<mapSize {
    let row = readLine()!
    map.append(row.map({Int(String($0))!}))
}


//bfs
func bfs(_ row:Int,_ col:Int) {
    
    var queue:[adj] = [(row,col)]
    
    visited[row][col] = true
    
    while !queue.isEmpty {
        let qRow:Int = queue.first!.row
        let qCol:Int = queue.first!.col
        
        queue.removeFirst()

        apartCount += 1
        
        for adj in adjs {
            let adjRow = adj.row + qRow
            let adjCol = adj.col + qCol
            
        if 0 <= adjRow && adjRow < mapSize && adjCol >= 0 && adjCol < mapSize {
            if map[adjRow][adjCol] == 1 && visited[adjRow][adjCol] == false{
                queue.append((adjRow,adjCol))
                visited[adjRow][adjCol] = true
                }
            }
        }
    }
}

for i in 0..<map.count {
    for j in 0..<map.count {
        if visited[i][j] == false && map[i][j] == 1 {
            bfs(i, j)
            aparts.append(apartCount)
            apartCount = 0
        }
    }
}


print(aparts.count)
aparts.sorted().map({ print(String($0)) })





/*7
0110100
0110101
1110101
0000111
0100000
0111110
0111000*/


/*5
10111
10111
01111
01111
10101
 */

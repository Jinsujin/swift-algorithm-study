import Foundation


/**
 단지 번호 부여(dfs)
 
  1. 단지가 정해지지 않은 기준 아파트 찾기: 반복문으로 격자 순회하면서 1 찾기
  2. 1 을 기준으로 인접한 모든 아파트를 찾는다(DFS)
  3. 단지 번호 부여
 */
class boj_2667 {
    
    private var grid: [[Int]] = Array(repeating: Array(repeating: 0, count: 30), count: 30)
    private var visit: [[Bool]] = Array(repeating: Array(repeating: false, count: 30), count: 30)
    private var apart = [Int](repeating: 0, count: 900)
    private var count: Int = 0 // 아파트 단지 수
    private var N = 0

    func solution() {
        let lineString = readLine() ?? ""
        let commandCount = Int(lineString) ?? 0
        N = commandCount
        
        for i in 0..<commandCount {
            let readline = readLine() ?? ""
            let arr = Array(readline).compactMap{ String($0) }
            for j in 0..<arr.count {
                grid[i][j] = Int(arr[j])!
            }
        }

        // 1일때(아파트 단지일때) dfs 호출
        for i in 0..<commandCount {
            for j in 0..<commandCount {
                if(grid[i][j] == 1) {
                    dfs(i, j)
                    count += 1
                }
            }
        }
        
        print(count)
        var splitApart = apart[2...count+1]
        splitApart.sort()
        splitApart.forEach{ print($0) }
    }

    // 행x, 열y
    private func dfs(_ x: Int,_ y: Int) {
        visit[x][y] = true
        
        grid[x][y] = count + 2
        apart[count + 2] += 1 // 단지 번호 카운트 증가하기
     
        let dx = [0,0,1,-1]
        let dy = [1,-1,0,0]
        for i in 0..<dx.count {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if !(0 <= nx && nx < N && 0 <= ny && ny < N) {
                continue
            }
            if grid[nx][ny] == 1 && visit[nx][ny] == false {
                dfs(nx, ny)
            }
        }
    }
}

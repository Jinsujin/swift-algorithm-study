//
//  N으로 표현.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/04/03.
//

import Foundation

func mySolutionOfN으로표현(_ N: Int, _ number: Int) -> Int {
    
    var min = 9 // N이 최소한으로 사용된 갯수
    var numberCount = [Int: Int]() // N을 <key>번 사용했을 때 증가할 카운트를 저장할 딕셔너리
    
    numberCount[1 * N] = 1
    numberCount[11 * N] = 2
    numberCount[111 * N] = 3
    numberCount[1111 * N] = 4
    
    dfs(count: 0, sum: 0, target: number)
    
    func dfs(count: Int, sum: Int, target: Int) {
        if count >= min {return}
        if sum == target {
            min = count
            return
        }
        
        for (usingNumber, _count) in numberCount {
            dfs(count: count + _count, sum: sum + usingNumber, target: target)
            dfs(count: count + _count, sum: sum - usingNumber, target: target)
            dfs(count: count + _count, sum: sum / usingNumber, target: target)
            dfs(count: count + _count, sum: sum * usingNumber, target: target)
        }
    }
    
    return min >= 9 ? -1 : min
}

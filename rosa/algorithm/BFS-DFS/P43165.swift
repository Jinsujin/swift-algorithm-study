//
//  P43165.swift
//  algorithm
//
//  Created by jsj on 2022/04/05.
//

import Foundation

/**
 타겟 넘버(DFS, BFS)
 https://programmers.co.kr/learn/courses/30/lessons/43165
 
 - n개의 음이 아닌 정수들이 있습니다. 이 정수들을 순서를 바꾸지 않고 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다. 예를 들어 [1, 1, 1, 1, 1]로 숫자 3을 만들려면 다음 다섯 방법을 쓸 수 있습니다.
 - 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.
 
 -1+1+1+1+1 = 3
 +1-1+1+1+1 = 3
 +1+1-1+1+1 = 3
 +1+1+1-1+1 = 3
 +1+1+1+1-1 = 3
 
 numbers    target    return
 [1, 1, 1, 1, 1]    3    5
 [4, 1, 2, 1]    4    2
 */
class programmers_43165 {
    func solution(_ numbers:[Int], _ target:Int) -> Int {
        var count = 0
        dfs(0,0)

        func dfs(_ index: Int,_ result: Int) {
            if index == numbers.count {
                if result == target {
                    count += 1
                }
                return
            }
            let plusResult = result + numbers[index]
            let minusResult = result - numbers[index]
            dfs(index + 1, plusResult)
            dfs(index + 1, minusResult)
        }
        return count
    }
}

//
//  타겟넘버.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/03/14.
//

import Foundation

func mySolutionOf타겟넘버(numbers: [Int], target: Int) -> Int {
    var answer = 0
    
    func DFS(sum: Int, index: Int) {
        if index == (numbers.count-1) && sum == target {
            answer += 1
            return
        }
        
        guard index + 1 < numbers.count else {return}
        
        DFS(sum: sum + numbers[index+1], index: index + 1)
        DFS(sum: sum - numbers[index+1], index: index + 1)
    }

    DFS(sum: 0, index: -1)
    
    
    return answer
}

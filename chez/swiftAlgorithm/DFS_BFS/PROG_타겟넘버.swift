//
//  PROG_타겟넘버.swift
//  swiftAlgorithm
//
//  Created by 최예주 on 2022/04/04.
//

import Foundation


func solPROG_targetNumber(){
    
    
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    let target = Int(readLine()!)!
    var answer = 0
    
    dfs(0,0)
    
    func dfs(_ num: Int, _ count: Int) {
        
        if count == numbers.count && num == target {
            answer += 1
            return
        }
        
        else if count == numbers.count {
            return
        }
        
        dfs(num + numbers[count], count+1)
        dfs(num - numbers[count], count+1)
    }
    print(answer)
    
}

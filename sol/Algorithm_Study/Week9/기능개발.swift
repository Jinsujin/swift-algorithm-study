//
//  기능개발.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/04/03.
//

import Foundation

func mySolutionOf기능개발(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var answer = [Int]()
    var index = 0, time = 1
    
    while index < progresses.count {
        var count = 0
        
        while time > 0 { // index번째 있는 기능을 완료하기 위해 필요한 시간(time) 구하는 while문
            if progresses[index] + speeds[index] * time >= 100 {
                count += 1
                break
            }
            time += 1
        }
        
        for k in (index+1)..<progresses.count { // 위에서 구한 time 시점에서 전체 중 완료된 기능들의 개수 카운트 구하는 for문
            if progresses[k] + speeds[k] * time >= 100 {
                count += 1
                index = k
            } else {
                break
            }
        }
        
        answer.append(count)
        index += 1
    }
    
    return answer
}

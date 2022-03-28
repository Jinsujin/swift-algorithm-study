//
//  17478.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/03/28.
//

import Foundation

func mySolutionOf17478() {
    
    let countRecursive = Int(readLine()!)!
    
    func recursiveStory(previousString: String, count: Int) -> String {
        var previousString = previousString
        let indent = [String](repeating: "_", count: 4 * (countRecursive - count)).joined()
        
        let storyLine1 = "\(indent)\"재귀함수가 뭔가요?\"\n"
        let storyLine2 = "\(indent)\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.\n"
        let storyLine3 = "\(indent)마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.\n"
        let storyLine4 = "\(indent)그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\"\n"
        let storyLine5 = "\(indent)\"재귀함수는 자기 자신을 호출하는 함수라네\"\n"
        let endStoryLine = "\(indent)라고 답변하였지.\n"
        
        if count < 1 {
            return previousString + storyLine1 + storyLine5 + endStoryLine
        }
        
        previousString += storyLine1 + storyLine2 + storyLine3 + storyLine4
        
        return recursiveStory(previousString: previousString, count: count-1) + endStoryLine
    }
    print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")
    print(recursiveStory(previousString: "", count: countRecursive))
}


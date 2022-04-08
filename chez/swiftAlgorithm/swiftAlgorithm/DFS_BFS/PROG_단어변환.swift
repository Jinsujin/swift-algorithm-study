//
//  PROG_단어변혼.swift
//  swiftAlgorithm
//
//  Created by 최예주 on 2022/04/05.
//

import Foundation

// 단어변환
// target이 words 안에 없다면 return 0
// 두 단어중 한글자 차이인지 계산 로직 필요
// 알파벳 하나만 다르고 아직 방문하지 않았다면-> 큐에 넣기



func solPROG_wordConversion(){
    
    func isDifferentOneChar(_ str1: String, _ str2: String) -> Bool {
        var count = 0
        
        for index in 0..<str1.count {
            let str1_index = str1.index(str1.startIndex, offsetBy: index)
            let str2_index = str1.index(str2.startIndex, offsetBy: index)
            
            if str1[str1_index] != str2[str2_index] {
                count += 1
            }
        }
        return count==1
        
    }



    let begin = "hit"
    let target = "cog"
    let words = ["hot","dot","dog","lot","log","cog"]


    if !words.contains(target) {
        print(0)
    }
    else {

        var queue = [begin]
        var visited = Array(repeating: false, count: words.count)
        var count = 0


        while !queue.isEmpty {

            let curWord = queue.popLast()!
            if curWord == target {
                break
            }
            count += 1
            for i in 0..<words.count {
                if !visited[i] &&  isDifferentOneChar(curWord, words[i]){  // 아직 방문하지 않은 애만 검사

        //            print(words[i])
                    queue.append(words[i])
                    visited[i] = true
                }
            }
        //    print("---")

        }

        print(count)
    }

    
}

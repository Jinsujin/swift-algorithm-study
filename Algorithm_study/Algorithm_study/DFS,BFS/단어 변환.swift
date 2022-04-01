//
//  단어 변환.swift
//  Algorithm_study
//
//  Created by dale on 2022/04/01.
//

import Foundation

func convertWord(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    let isConvertable: (String,String) -> Bool = {word, nextWord in
        let alphabets = Array(word)
        let nextAlphabets = Array(nextWord)
        var count = 0
        for i in 0..<alphabets.count {
            if alphabets[i] == nextAlphabets[i] {
                count += 1
            }
        }
        return (count == alphabets.count-1)
    }
    let wordsCount = words.count
    var answer = wordsCount-1
    func dfs(_ string: String,_ index: Int, _ count: Int) {
        if count >= answer {
            return
        }
        if string == target {
            if answer > count {
                answer = count
            }
            return
        }
        for i in words {
            if isConvertable(string, i) {
                dfs(i, index+1, count+1)
            }
        }
    }
    dfs(begin, 0, 0)
    return answer
}

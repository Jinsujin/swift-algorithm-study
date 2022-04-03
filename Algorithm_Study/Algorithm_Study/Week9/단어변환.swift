//
//  단어변환.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/04/03.
//

import Foundation

func mySolutionOf단어변환(_ begin: String, _ target: String, _ words: [String]) -> Int {
    
    var min = 0
    
    func dfs(count: Int, prev: String, _words: [String]) {
        if prev == target { return min = count}
        
        let prevAlphbets = prev.map{String($0)}
        
        for index in 0..<_words.count {
            var sameAlphabets = 0
            let wordAlphabets = _words[index].map{String($0)}
            (0..<wordAlphabets.count).forEach {
                if prevAlphbets[$0] == wordAlphabets[$0] {
                    sameAlphabets += 1
                }
            }
            
            if sameAlphabets == prev.count - 1 {
                var _words = _words
                let prev = _words.remove(at: index)
                dfs(count: count + 1, prev: prev, _words: _words)
            }
        }
    }
    
    dfs(count: 0, prev: begin, _words: words)
    
    return min
}

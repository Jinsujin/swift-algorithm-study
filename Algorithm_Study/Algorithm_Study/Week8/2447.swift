//
//  2447.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/03/28.
//

import Foundation

func mySolutionOf2447() {
    let inputNumber = Int(readLine()!)!
    var stars = [[String]](repeating: [String](repeating: "*", count: inputNumber), count: inputNumber)

    func setStar(n: Int, count: Int) {
        if 3 * n == count {return}
        
        for i in 0..<n {
            for j in 0..<n{
                if (i/count) % 3 == 1 && (j/count) % 3 == 1 {
                    stars[i][j] = " "
                }
            }
        }
        
        setStar(n: n, count: count * 3)
    }
    
    setStar(n: inputNumber, count: 1)
    
    stars.forEach {
        print($0.joined())
    }
}


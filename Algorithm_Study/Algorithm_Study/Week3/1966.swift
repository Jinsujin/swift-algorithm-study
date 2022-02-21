//
//  1966.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/02/21.
//

import Foundation

struct Queue2 {
    public private(set) var queue = [(Int, Int)]()
    var isEmpty: Bool {
        return self.queue.isEmpty
    }
    var size: Int {
        return self.queue.count
    }
    
    mutating func push(_ element1: Int, _ element2: Int ) {
        self.queue.append((element1, element2))
    }
    
    mutating func pop() -> (Int, Int)? {
        return queue.isEmpty ? nil : self.queue.removeFirst()
    }
    
    var max: Int {
        var maxValue = 0
        self.queue.forEach {
            if $0.0 > maxValue {
                maxValue = $0.0
            }
        }
        return maxValue
    }
}

func mySolutionOf1966() {
    let testCaseCount = Int(readLine()!) ?? 0
    
    for _ in 0..<testCaseCount {
        let input = readLine()!.components(separatedBy: " ").map {Int($0) ?? 0}
        let targetDocument = input[1]
        var queue = Queue2()
        var printCount = 1
        let documentArray = readLine()!.components(separatedBy: " ").map {
            return Int($0) ?? 0
        }
        documentArray.enumerated().forEach {
            queue.push($0.element, $0.offset)
        }
        
        while !queue.isEmpty {
            let maxPriority = queue.max
            let currentDocument = queue.pop()!
            if currentDocument.0 == maxPriority {
                if currentDocument.1 == targetDocument {
                    break
                } else {
                    printCount += 1
                }
            } else {
                queue.push(currentDocument.0, currentDocument.1)
            }
        }
        print(printCount)
    }
}

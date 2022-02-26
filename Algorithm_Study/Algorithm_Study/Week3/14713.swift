//
//  14713.swift
//  Algorithm_Study
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation


struct Queue3 {
    public private(set) var queue = [String]()
    var isEmpty: Bool {
        return self.queue.isEmpty
    }
    var size: Int {
        return self.queue.count
    }
    var head: String? {
        return self.queue.first
    }
    var tail: String? {
        return self.queue.last
    }
    
    mutating func push(_ element: String) {
        self.queue.append(element)
    }
    
    mutating func pop() -> String? {
        return queue.isEmpty ? nil : self.queue.removeFirst()
    }
    
}

func mySolutionOf14713() {
    
    let numberOfSentence = Int(readLine()!) ?? 0
    var queueArray = (0..<numberOfSentence).map { _ -> Queue3 in
        return Queue3()
    }
    var count = 0
    for order in 0..<numberOfSentence {
        readLine()!.components(separatedBy: " ").forEach {
            queueArray[order].push($0)
            count += 1
        }
    }
    var targetSentence = readLine()!.components(separatedBy: " ")
    if count != targetSentence.count {
        return print("Impossible")
    }
    while !targetSentence.isEmpty {
        let targetWord = targetSentence.removeFirst()
        for i in 0..<numberOfSentence {
            if queueArray[i].head == targetWord {
                queueArray[i].pop()
                break
            }
        }
    }
    
    print(queueArray.filter {
        !$0.isEmpty
    }.count == 0 ? "Possible" : "Impossible")
}

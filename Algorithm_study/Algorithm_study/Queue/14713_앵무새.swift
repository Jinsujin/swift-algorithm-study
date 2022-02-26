//
//  14713_앵무새.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/20.
//

import Foundation

func p14713() {
    let count = Int(readLine()!)!
    var queueArr : [Queue] = Array(repeating: Queue<String>(), count: count)
    for i in 0..<count {
        readLine()!.components(separatedBy: " ").forEach{queueArr[i].enqueue($0)}
    }
    var targetQueue = Queue<String>()
    readLine()!.components(separatedBy: " ").forEach{targetQueue.enqueue($0)}
    for _ in 0..<targetQueue.queue.count {
        for j in 0..<count {
            if queueArr[j].isEmpty {
                continue
            }
            if queueArr[j].first == targetQueue.first {
                targetQueue.dequeue()
                queueArr[j].dequeue()
                break
            }
        }
    }
    print(targetQueue.isEmpty && (queueArr.filter{!$0.isEmpty}.count == 0) ? "Possible" : "Impossible")
}



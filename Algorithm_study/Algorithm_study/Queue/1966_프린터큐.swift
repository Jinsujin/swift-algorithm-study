//
//  1966_프린터큐.swift
//  Algorithm_study
//
//  Created by dale on 2022/02/19.
//

import Foundation
func p1966() {
    for _ in 0..<Int(readLine()!)! {
        var docsQueue = Queue<Int>()
        var indexQueue = Queue<Int>()
        var printCount = 1
        let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
        let docs = readLine()!.components(separatedBy: " ").map{Int($0)!}
        (0..<input[0]).forEach{indexQueue.enqueue($0)}
        docs.forEach{docsQueue.enqueue($0)}
        while !docsQueue.isEmpty {
            if docsQueue.first == docsQueue.queue.max() {
                if indexQueue.first == input[1]{
                    break
                }else{
                    docsQueue.dequeue()
                    indexQueue.dequeue()
                    printCount += 1
                }
            }else {
                docsQueue.enqueue(docsQueue.dequeue())
                indexQueue.enqueue(indexQueue.dequeue())
            }
        }
        print(printCount)
    }
}

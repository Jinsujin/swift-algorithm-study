//
//  백준-1966-프린터큐.swift
//  0x06-큐
//
//  Created by 김상혁 on 2022/02/21.
//

import Foundation

struct Document {
    let priority: Int
    let index: Int
}

struct PrinterQueue {
    var queue: [Document] = []
    var size: Int {
        return queue.count
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    mutating func push(Element: Document) {
        queue.append(Element)
    }
    
    mutating func pop() -> Document? {
        return isEmpty() ? nil : queue.removeFirst()
    }
    
    func canPrint(_ document: Document) -> Bool {
        if document.priority > queue.max(by: { $0.priority > $1.priority })!.priority {
            return false
        }
        return true
    }
}

func solution1966() {
    let inputCount = Int(readLine()!)!
    var printQueue = PrinterQueue()
    var count = 1
    
    for _ in 0..<inputCount {
        let eachTestCase = readLine()!.components(separatedBy: " ").map{ Int($0)! } // 6 0
        let documentCount = eachTestCase[0]
        let curiousDocumentIndex = eachTestCase[1]
        
        
        let documentPriorities = readLine()!.components(separatedBy: " ").map{ Int($0)! } // 1 1 9 1 1 1
        
        for i in 0..<documentPriorities.count {
            printQueue.push(Element: Document(priority: documentPriorities[i], index: i + 1))
        }

        while !printQueue.isEmpty() {
    
            let first = printQueue.pop()!
            
            if printQueue.canPrint(first) {
                
                if first.index == curiousDocumentIndex {
                    print(count)
                    break
                }
                else {
                    count += 1
                }
            }
            else {
                printQueue.push(Element: first)
            }
        }
    }
}

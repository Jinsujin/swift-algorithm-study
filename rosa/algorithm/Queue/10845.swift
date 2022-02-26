import Foundation

/**
 큐
 https://www.acmicpc.net/problem/10845
 
 - push X: 정수 X를 큐에 넣는 연산이다.
 - pop: 큐에서 가장 앞에 있는 정수를 빼고, 그 수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 - size: 큐에 들어있는 정수의 개수를 출력한다.
 - empty: 큐가 비어있으면 1, 아니면 0을 출력한다.
 - front: 큐의 가장 앞에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 - back: 큐의 가장 뒤에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 */
class boj_10845 {
    
    private var queue = Queue()
    
    func solution() {
        let lineString = readLine() ?? ""
        let commandCount = Int(lineString) ?? 0
        
        for _ in 0..<commandCount {
            let readline = readLine() ?? ""
            let readStrings = readline.components(separatedBy: " ")
            commandAction(readStrings)
        }
    }
    
    private func commandAction(_ readCommands: [String]) {
        let command = readCommands[0]
        switch command {
        case "push":
            queue.push(Int(readCommands[1])!)
        case "pop":
            let popItem = queue.pop()
            print(popItem ?? -1)
        case "size":
            print(queue.size)
        case "empty":
            print(queue.isEmpty ? 1 : 0)
        case "front":
            print(queue.front ?? -1)
        case "back":
            print(queue.back ?? -1)
        default:
            break
        }
    }
    
    
    struct Queue {
        private var elements = [Int]()
        
        mutating func pop() -> Int? {
            if isEmpty {
                return nil
            }
            return elements.removeFirst()
        }
        
        mutating func push(_ element: Int) {
            self.elements.append(element)
        }
        
        var isEmpty: Bool {
            return elements.isEmpty
        }
        
        var size: Int {
            return elements.count
        }
        
        var front: Int? {
            return elements.first
        }
        
        var back: Int? {
            return elements.last
        }
    }
}

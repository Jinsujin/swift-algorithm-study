import Foundation

/**
 스택
 https://www.acmicpc.net/problem/10828
 */

var stack = Stack()

func solution_10828() {
    // 첫번째 값은 명령의 수
    let lineString = readLine() ?? ""
    let commandCount = Int(lineString) ?? 0
    
    for _ in 0..<commandCount {
        let readline = readLine() ?? ""
        let readStrings = readline.components(separatedBy: " ")
        solution(readStrings)
    }
}


fileprivate func solution(_ readCommands: [String]) {
    let command = readCommands[0]
    switch command {
    case "push":
        stack.push(Int(readCommands[1]) ?? 0)
    case "pop":
        let popItem = stack.pop()
        print(popItem ?? -1)
    case "top":
        print(stack.top() ?? -1)
    case "size":
        print(stack.size)
    case "empty":
        print(stack.isEmpty ? 1 : 0)
    default:
        break
    }
}


/**
 push X: 정수 X를 스택에 넣는 연산이다.
 pop: 스택에서 가장 위에 있는 정수를 빼고, 그 수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 size: 스택에 들어있는 정수의 개수를 출력한다.
 empty: 스택이 비어있으면 1, 아니면 0을 출력한다.
 top: 스택의 가장 위에 있는 정수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 
 */

struct Stack {
    private var elements = [Int]()
    
    var isEmpty: Bool {
        return self.elements.isEmpty
    }
    
    var size: Int {
        return self.elements.count
    }
    
    mutating func push(_ element: Int) {
        self.elements.append(element)
    }
    
    mutating func pop() -> Int? {
        return self.elements.popLast()
    }
    
    func top() -> Int? {
        return self.elements.last
    }
}


import Foundation


/**
 덱(Double Ended Queue)
 https://www.acmicpc.net/problem/10866
 양쪽 끝에서 삽입과 삭제가 전부 가능
 
 - 원소 추가 O(1)
 - 원소 제거 O(1)
 - 가장 앞, 뒤 원소 확인 O(1)
 - 가장 앞, 뒤가 아닌 원소들의 확인, 변경은 불가(but, STL deque 에서는 인덱스로 원소에 접근 가능)
 - 배열을 이용한 구현이 쉽다
 
 
 head: 가장 앞에 있는 원소의 index
 tail: 가장 뒤에 있는 원소의 index + 1
 
 head, tail 의 초기값은 0 이 아닌, MX
 - 큐에서는 앞쪽에서만 제거, 뒤에서는 삽입만 일어남 => 뒤로 확장하는 형태
 - 덱에서는 양쪽 모두 삽입 가능 => 양쪽으로 확장하는 형태
   - 시작지점을 배열의 중간에 둬야 한다. 시작index 가 0 이면 안됨
 */
class boj_10866 {
    private var deque = Deque(max: 1000005)
    
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
        case "push_back":
            deque.push_back(Int(readCommands[1])!)
        case "push_front":
            deque.push_front(Int(readCommands[1])!)
        case "pop_back":
            let popItem = deque.pop_back()
            print(popItem ?? -1)
        case "pop_front":
            let popItem = deque.pop_front()
            print(popItem ?? -1)
        case "size":
            print(deque.size)
        case "empty":
            print(deque.isEmpty ? 1 : 0)
        case "front":
            print(deque.front() ?? -1)
        case "back":
            print(deque.back() ?? -1)
        default:
            break
        }
    }
    
    struct Deque {
        private let max: Int
        private var head: Int
        private var tail: Int
        private var elements = [Int]()
        
        init(max: Int) {
            self.max = max
            elements = Array(repeating: 0, count: 2 * max + 1)
            head = max
            tail = max
        }
        
        var isEmpty: Bool {
            if head != tail {
                return false
            }
            return true
        }
        
        var size: Int {
            return tail - head
        }
        
        mutating func push_front(_ x: Int) {
            head -= 1
            elements[head] = x
        }

        mutating func push_back(_ x: Int) {
            elements[tail] = x
            tail += 1
        }

        mutating func pop_front() -> Int? {
            let frontElement = elements[head]
            if frontElement == 0 {
                return nil
            }
            elements[head] = 0
            head += 1
            return frontElement
        }

        mutating func pop_back() -> Int? {
            // 1.범위를 벗어난 값 체크
            if head > tail - 1 {
                return nil
            }
            // 2. 범위를 벗어나진 않았지만, 해당 값이 0인지 체크
            let backElement = elements[tail - 1]
            if backElement == 0 {
                return nil
            }
            // 값이 있는경우
            tail -= 1
            elements[tail] = 0
            return backElement
        }

        func front() -> Int? {
            let element = elements[head]
            if element == 0 {
                return nil
            }
            return element
        }

        func back() -> Int? {
            let element = elements[tail-1]
            if element == 0 {
                return nil
            }
            return element
        }
    }
}


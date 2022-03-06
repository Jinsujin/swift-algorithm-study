import Foundation

/**
 요세푸스 순열
 https://www.acmicpc.net/problem/1158

 - 결과: 시간초과
  
 1번부터 N번까지 N명의 사람이 원을 이루면서 앉아있고, 양의 정수 K(≤ N)가 주어진다. 이제 순서대로 K번째 사람을 제거한다.
 한 사람이 제거되면 남은 사람들로 이루어진 원을 따라 이 과정을 계속해 나간다. 이 과정은 N명의 사람이 모두 제거될 때까지 계속된다.
 원에서 사람들이 제거되는 순서를 (N, K)-요세푸스 순열이라고 한다.
 예를 들어 (7, 3)-요세푸스 순열은 <3, 6, 2, 7, 5, 1, 4>이다.
 
 
 */


func solution_1156() {
    let lineString = readLine() ?? ""
    let intArray = lineString.split(separator: " ").compactMap{ Int($0) }
    
    let result = solution(intArray[0], intArray[1])
    print(result)
    
    // 3,6,2,7,5,1,4
    //print(solution(7, 3))
}


fileprivate func solution(_ N:Int, _ K:Int) -> [Int] {
    var result: [Int] = []
    var linkedList = LinkedList()
    
    //1. 링크드 리스트에 1~N 을 넣는다
    for i in 1...N {
        linkedList.append(i)
    }
    
    // result 가 N 이 될때까지 반복
    while (result.count < N) {
        let removedValue = linkedList.remove(K)
        result.append(removedValue)
    }
    return result
}


// MARK:- Node
class Node {
    let value: Int
    var next: Node?
    var isRemoved: Bool = false
    
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}


// MARK:- LinkedList
struct LinkedList {
    private var head: Node?
    private var previous: Node?

    mutating func append(_ value: Int) {
        let newNode = Node(value: value)
        if head == nil {
            self.head = newNode
            return
        }
        
        // 노드의 가장 마지막에 새로운 노드 추가
        var current = head
        while current?.next != nil {
            current = current?.next
            if current?.next?.value == head?.value {
                break
            }
        }
        // 환형 리스트: 가장 마지막 노드는 head를 가르킨다
        newNode.next = head
        current?.next = newNode
    }
    
    func printItems() {
        var current = head
        while current != nil {
            if !current!.isRemoved {
                print(current?.value ?? "")
            }
            current = current?.next
            if current?.value == head?.value  { break }
        }
    }
    
    // N번째 위치를 제거한다
    mutating func remove(_ n: Int) -> Int {
        if previous == nil {
            var current = head
            var index = n-1
            while(index > 0) {
                current = current?.next
                index -= 1
            }
            current?.isRemoved = true
            previous = current
            return current?.value ?? -1
        }
        var current = previous
        var index = n
        while(index > 0) {
            current = current?.next
            if current!.isRemoved {
                continue
            }
            index -= 1
        }
        current?.isRemoved = true
        previous = current
        return current?.value ?? -1
    }
}

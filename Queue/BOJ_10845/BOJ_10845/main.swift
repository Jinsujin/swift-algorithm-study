//
//  main.swift
//  BOJ_10845
//
//  Created by 박진섭 on 2022/02/19.
//

import Foundation
//처음 input은 명령의 수를 나타냄
let firstInput = Int(readLine()!)!

//빈 배열 Queue를 만듬
var Queue:[Int] = []

//head,tail
var head:Int = 0
var tail:Int = 0

//명령의 횟수를 셀 Count변수
var count = 0

//MARK: -- 명령 로직
//Queue에 Int를 추가하고 tail값을 1 올린다
func push(_ int:Int) {
    Queue.append(int)
    tail += 1
}

//Queue의 첫번째 수를 출력, head를 1올림
func pop() {
    if Queue.count > head {       //head가 최대로 올라갈 수 있는 count는 현재 Queue의 크기만큼. 그외는 out of range
        print(Queue[head])
        head += 1
    } else {
        print(-1)
    }
}

//Queue의 갯수는 tail에서 head를 뺀 수이다. 단 pop이 연속으로 되면 size가 -가 될수 있으므로 최소값을 0으로 해준다.
func size() {
    tail - head >= 0 ? print(tail - head) : print(0)
}


//tail과 Head가 같으면 큐안에 모든 요소가 없는 것임.
func empty() {
    tail - head == 0 ? print(1) : print(0)
}

//pop 함수를 활용한다.
func front() {
    if Queue.count > head {       //head가 최대로 올라갈 수 있는 count는 현재 Queue의 크기만큼. 그외는 out of range
        print(Queue[head])
    } else {
        print(-1)
    }
}

//마찬가지로 pop함수를 활용한다.
func back() {
    if Queue.count > head {       //head가 최대로 올라갈 수 있는 count는 현재 Queue의 크기만큼. 그외는 out of range
        print(Queue[tail - 1])    //가장 마지막 원소의 index는 tail - 1임.
    } else {
        print(-1)
    }
}

//MARK: -- 실행로직
//input들어온 만큼 실행하도록함.
while count < firstInput {
    //input을 공백단위로 나눔
    let input = readLine()!.split(separator: " ")
    //첫번쨰 요소는 명령어
    let method = input[0]
    
    //두번쨰 요소는 숫자
    let number = input.count == 2 ? Int(input[1])! : nil
    
    switch method {
        case "push": push(number!)
        case "pop": pop()
        case "size": size()
        case "empty": empty()
        case "front": front()
        case "back": back()
    
        default: print("")
    
    }
    
    count += 1
    
    print("현재카운트는 :\(count)")
    print("현재 큐는 :\(Queue)")
    print("현재 Head는 \(head)")
    print("현재 tail은 \(tail)")
    
    
}

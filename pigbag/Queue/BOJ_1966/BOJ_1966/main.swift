//
//  main.swift
//  BOJ_1966
//
//  Created by 박진섭 on 2022/02/20.
//

import Foundation

//MARK: -- 입력 및 출력 구현

//처음 input은 시행할 횟수
let firstInput = Int(readLine()!)!

//횟수를 셀 변수
var count = 0

//선형 큐를 구현해보자
while count < firstInput {
    //첫번째줄 input
    let firstLine = readLine()!.components(separatedBy: " ")

    //두번째 줄 input은 문서의 배열이 들어옴.
    let documentArray = readLine()!.components(separatedBy: " ").map { Int($0)! }
    
    //문서의 갯수
    var head = 0
    var tail = 0

    //궁금한 문서가 몇번째에 있는지
    var goal = Int(firstLine[1])!
    
    //먼저 문서배열을 복사.
    var copyDoucmentArray = documentArray
    
    //문서를 출력한 횟수
    var popCount = 0
    
    //궁금한 문서의 인덱스에 해당하는 문서가 나올때 까지 루프를 돌린다.
    while true {
        tail = documentArray.count
        var removedElement:Int = 0
        //isPop함수가 true면 큐에서 제거하고 출력횟수 + 1
        if isPoped(array: copyDoucmentArray, currentHead: &head, currentTail: &tail) {
            removedElement = copyDoucmentArray.remove(at: head)
            popCount += 1
                    if goal == 0 { //goal이 0이될때 즉, 자기 차례가 됬을때 삭제가 되면 루프 종료
                    print(popCount)
                    break
                }
        
        //그렇지 않다면 끝에다가 현재 head가 가르키고 있는 요소를 끝에다 배치한다.
        } else {
            let willRelpaceElement = copyDoucmentArray.remove(at: head) //지우고
            copyDoucmentArray.append(willRelpaceElement) //append하면 뒤에다가 다시 생길것임/
        }
        
        //루프가 한번 돌때마다 문서의 위치는 1씩 감소 한다.
        //만약 0이 된다면 현재 남아 있는 문서의 제일 뒤로 갈것이므로 tail - 1 값을 넣어주기.
        if goal == 0 {
            goal = tail - 1
        } else {
            goal -= 1
        }
        
    }
    
    //명령어 실행 횟수
    count += 1
}

//MARK: -- 함수들

//원형으로 만들기 위해 index를 검사하자.
func isEndIndex(array:[Int], currentHead:Int , currentTail:Int) -> Bool {
    
    if currentTail - 1 == currentHead {
        return true
    }
        
    return false
}


//현재 배열에서 남아있는 중요도중 가장 큰것과 비교해서 pop할지 말지 정한다.
func isPoped(array:[Int], currentHead: inout Int, currentTail: inout Int) -> Bool {
    
    //현재 배열에서 가장 높은 중요도를 구한다
    let currentImportance = array.first {  $0 == array.max()  }
    
    //현재 헤드가 가르키는 것이 배열에서 가장 앞에 있는 것
    let currentDoucument = array[currentHead]
    
    //두 변수를 비교해서 같으면 true를 리턴한다
    if currentDoucument == currentImportance {
        return true
    } else {
        return false
    }
    
    //끝 index인지 확인하고 검사 한번 할때마다 head를 1씩 올린다
    if isEndIndex(array: array, currentHead: currentHead, currentTail: currentTail) {
        currentHead = 0
    } else {
        currentHead += 1
    }
    
}

//
//  main.swift
//  Programmers_N
//
//  Created by 박진섭 on 2022/04/03.
//

//MARK: 프로그래머스 N으로 표현.

/*
 문제 설명
 아래와 같이 5와 사칙연산만으로 12를 표현할 수 있습니다.

 12 = 5 + 5 + (5 / 5) + (5 / 5)
 12 = 55 / 5 + 5 / 5
 12 = (55 + 5) / 5

 5를 사용한 횟수는 각각 6,5,4 입니다. 그리고 이중 가장 작은 경우는 4입니다.
 이처럼 숫자 N과 number가 주어질 때, N과 사칙연산만 사용해서 표현 할 수 있는 방법 중 N 사용횟수의 최솟값을 return 하도록 solution 함수를 작성하세요.

 제한사항
 N은 1 이상 9 이하입니다.
 number는 1 이상 32,000 이하입니다.
 수식에는 괄호와 사칙연산만 가능하며 나누기 연산에서 나머지는 무시합니다.
 최솟값이 8보다 크면 -1을 return 합니다.
 */


import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var result = -1

    if N == number { return 1 }

    func dfs(_ count:Int, _ now: Int) {
        if count > 8 { return }         //count가 8보다 크면 리턴.

        //매개변수로 넣은 now와 만들어야 할 숫자 number가 같으면,
        if now == number {
            //근데 number는 같지만 횟수가 더 클수도 있으므로, 현재 있는 횟수(count)가 저장해놓은 (result)보다 작거나 result == -1이면(초깃값 혹은 값없을때),
            //result = count
            if count < result || result == -1 {
                result = count
            }
            return
        }
        
        //수 N개를 이용해서 숫자를 만든다. Ex) 5, 55, 555, 5555, 55555
        var baseN = 0

        for i in 1..<8 {
            //위 식에서 result가 -1일 경우를 걸렀는데도 -1이고 count + i가 result(현재결과) 보다 작다면 count를 더 할 필요 없음 break
            if result != -1 && result < count + i {
                break
            }

            baseN = baseN * 10 + N
            dfs(count + i, now + baseN)
            dfs(count + i, now - baseN)
            dfs(count + i, now * baseN)
            dfs(count + i, now / baseN)
        }
    }

    dfs(0, 0)
    return result
}


//number가 N개 있을때 의 경우의 수를 생각하자.

//Number가 N개 있을 때 계산 할 수 있는 나오는 경우는


/*
 N = 1
 N
 
 N = 2
 NN
 N/N
 
 N = 3
 NNN
 N/NN
 NN/N
 
 N = 4
 NNNN
 N/NNN
 NN/NN
 NNN/N
 
 */



/*
 
 import Foundation

 func solution(_ N:Int, _ number:Int) -> Int {
     
     if N == number {return 1}
     
     var expressions = [Int:[Int]]()
     var usecount = [Int:Int]()
     expressions[1] = [N]   // 5를 1개 사용하여 표현 가능한 숫자: 5
     usecount[N] = 1   // 5를 표현하는 데에 필요한 숫자: 1개
     
     func expressable(_ num: Int, use count: Int) {
         guard usecount[num] == nil else {return}
         guard 0 < num && num <= 32000 else {return}

         expressions[count]?.append(num)
         usecount[num] = count
     }
     
     for count in 2...8 {
         expressions[count] = [Int]()
         
         // N을 count번 반복
         if makeRepeating(N, count: count) == number { return count }
         expressable(makeRepeating(N, count: count), use: count)
         
         for i in 1..<count {
             guard let numbers1 = expressions[i], let numbers2 = expressions[count-i] else {
                 continue
             }
             
             for op1 in numbers1 {
                 for op2 in numbers2 {
                     if op1/op2==number||op1-op2==number||op1+op2==number||op1*op2==number {
                         return count
                     }
                     expressable(op1/op2, use: count)
                     expressable(op1-op2, use: count)
                     expressable(op1+op2, use: count)
                     expressable(op1*op2, use: count)
                 }
             }
         }
     }
     return -1
 }

 func makeRepeating(_ num: Int, count: Int) -> Int {
     var result = 0
     for _ in 0..<count {
         result = result*10 + num
     }
     return result
 }
 
 */

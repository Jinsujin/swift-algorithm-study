//
//  17478_재귀함수가 뭔가요 ?.swift
//  Algorithm_study
//
//  Created by dale on 2022/03/26.
//

import Foundation

func p17418() {
    let n = Int(readLine()!)!
    let defaultString = """
    어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.
    """
    print("\(defaultString)\n\(reculsive(n))")
    func reculsive(_ m : Int) -> String {
        let line = String(repeating: "_", count: 4*(n-m))
        let string : String =
            """
            \(line)"재귀함수가 뭔가요?"
            \(line)"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.
            \(line)마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.
            \(line)그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어."
            """
        if m < 1 {
            let answer =
            """
            \(line)"재귀함수가 뭔가요?"
            \(line)"재귀함수는 자기 자신을 호출하는 함수라네"
            \(line)라고 답변하였지.
            """
            return "\(answer)"
        }
        return "\(string)\n\(reculsive(m-1))\n\(line)라고 답변하였지."
    }
}

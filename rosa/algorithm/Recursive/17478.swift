import Foundation

/**
 재귀함수가 뭔가요?
 https://www.acmicpc.net/problem/17478
 */
class boj_17478 {
    
    func solution() {
        let lineString = readLine() ?? ""
        let commandCount = Int(lineString) ?? 0
        boj(commandCount)
    }

    private func boj(_ count: Int) {
        let underbar = "____"
        let total = count
        print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")
        recursive(count)
        func recursive(_ count: Int) {
            let underbarCount = total - count
            let bar = Array(repeating: underbar, count: underbarCount).joined()
            print(bar + #""재귀함수가 뭔가요?""#)
            if (count == 0) {
                print(bar + #""재귀함수는 자기 자신을 호출하는 함수라네""#)
                print(bar + "라고 답변하였지.")
                return
            }
            print(bar + #""잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어."#)
            print(bar + "마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.")
            print(bar + #"그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.""#)
            recursive(count-1)
            print(bar + "라고 답변하였지.")
        }
    }
}


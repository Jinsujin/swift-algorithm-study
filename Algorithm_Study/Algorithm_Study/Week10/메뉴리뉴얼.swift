import Foundation

func mySolutionOf메뉴리뉴얼(_ orders: [String],_ course: [Int]) -> [String] {
    var returnArray = [String]()
    var courseDictionary = [String: Int]()
    
    for _course in course {
        let filteredOrders = orders.filter {$0.count >= _course}
        filteredOrders.forEach {
            let orderedMenu = dfs(with: $0, count: _course)
            orderedMenu.forEach { menu in
                let previousValue = courseDictionary[menu] ?? 0
                courseDictionary[menu] = previousValue + 1
            }
            
        }
        print(courseDictionary)
        var filteredCourseDic = courseDictionary
            .filter {$0.key.count == _course && $0.value >= 2}
            .sorted {$0.value > $1.value}

        if filteredCourseDic.count >= 1 {
            let target = filteredCourseDic.removeFirst()
            returnArray.append(target.key)

            while filteredCourseDic.contains(where: {$0.value == target.value}) {
                returnArray.append(filteredCourseDic.removeFirst().key)
            }
        }
    }
    return returnArray.sorted()
}

fileprivate func dfs(with str: String, count: Int) -> [String] {
    var array = [String]()
    if count <= 1 {
        array.append(contentsOf: str.map({String($0)}))
        return array
    }
    var arr = Array(str)
    
    while !arr.isEmpty {
        let digit = String(arr.removeFirst())
        let string = String(arr)
        let new = dfs(with: string, count: count - 1)
        array += new.map {
            String((digit + $0).sorted())
        }
    }
    return array
}

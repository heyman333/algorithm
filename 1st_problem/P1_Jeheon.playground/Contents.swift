
/* ------------------------------------------------------------------------------------------------------
 1st Problem 🖊
 1차원의 점들이 주어졌을 때, 그 중 가장 거리가 짧은 것의 쌍을 출력하는 함수를 작성하시오. (단 점들의 배열은 모두 정렬되어있다고 가정한다.)
 예를들어 S={1, 3, 4, 8, 13, 17, 20} 이 주어졌다면, 결과값은 (3, 4)가 될 것이다.

 출처: http://codingdojang.com/scode/408?langby=#answer-filter-area
 ------------------------------------------------------------------------------------------------------ */

import Foundation

func solution1(_ s: [Int]) -> (Int, Int) {
    var s2 = [Int]()
    for index in 0 ..< s.count - 1 {
        s2.append(s[index + 1] - s[index])
    }
    
    let minIndex = s2.index(of: s2.min()!)!
    return (s[minIndex], s[minIndex + 1])
}


// 거리가 짧은 쌍이 여러개 있을 때
func solution2(_ s: [Int]) -> [(Int, Int)] {
    var s2 = [Int]()
    for index in 0 ..< s.count - 1 {
        s2.append(s[index + 1] - s[index])
    }
    
    return s2.enumerated().filter { $0.element == s2.min() }.map { (s[$0.offset], s[$0.offset + 1]) }
}



let s = [10, 1, 5, 8, 3, 15].sorted()

let result1 = solution1(s)
let result2 = solution2(s)

print("result1: \(result1)")
print("result2: \(result2)")


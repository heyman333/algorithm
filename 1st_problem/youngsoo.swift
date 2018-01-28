//: Playground - noun: a place where people can play

import UIKit

func minAbstraction(_ arr:[Int]) {
    
    var abstractionArr:[Int] = []
    
    for (index, _) in arr.enumerated() {
        if (index != arr.count - 1) {
            let abs = arr[index+1] - arr[index]
            abstractionArr.append(abs)
        }
    }
    let sortedArr = abstractionArr.sorted {$0 < $1}
    for (index, value) in abstractionArr.enumerated() {
        if (sortedArr[0] == value) {
            print("\(index + 1)번째 \(index + 2)번째 숫자")
            print(arr[index], arr[index+1])
        }
    }
    
}

var nums = [1, 20, 21, 40, 50, 51, 52] // 정렬된 배열
minAbstraction(nums)






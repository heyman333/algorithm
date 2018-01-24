import Foundation

// 같은 차이가 있는 값이 2개가 있으면 둘 다 리턴, 차이가 안 나는 값이 있으면 그 쌍을 리턴.
// 소수점, 마이너스도 지원
let sampleArray: [Double] = [-1.5, -1.0, 1.0, 3.0, 4.0, 8.0, 9.0, 13.0, 13.5, 17.0, 20.0]

func minimumDiffTuples(in array: [Double]) -> [(Double, Double)] {
  
  var tupleArray: [(Double, Double)] = []
  for i in 0 ..< (array.count - 1) {
    tupleArray.append((array[i], array[i+1]))
  }
  var answers: [(Double, Double)] = []
  var minimumDiff: Double = array[array.count - 1] - array[0]
  
  _ = tupleArray.map { (tuple) in
    let diff = tuple.1 - tuple.0
    if diff == minimumDiff {
      answers.append(tuple)
    } else if diff < minimumDiff {
      answers = [tuple]
    }
    minimumDiff = min(minimumDiff, diff)
  }
  
  return answers
}

print(minimumDiffTuples(in: sampleArray))

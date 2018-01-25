//: Playground - noun: a place where people can play

import UIKit

struct PointInfoStruct {
    var sign: Bool
    var fabsValue: Double
    init(_ value: Double) {
        if value > 0 {
            sign = true
            fabsValue = fabs(value)
        } else {
            sign = false
            fabsValue = fabs(value)
        }
    }
}
struct ResultStruct {
    var centerPoint: PointInfoStruct
    var anotherPoint: PointInfoStruct
    var distance: Double
}

extension Double {
    func roundToSix() -> Double {
        return Double(String(format: "%.6f", self))!
    }
}

func makePoints(_ points: [Double]) -> [PointInfoStruct] {
    var results: [PointInfoStruct] = [PointInfoStruct]()
    for point in points {
        results.append(PointInfoStruct.init(point))
    }
    return results
}
func distancePointToPoint(_ startPoint: PointInfoStruct, _ targetPoint: PointInfoStruct) -> Double {
    if startPoint.sign == true && targetPoint.sign == true {
        var highValue: Double = startPoint.fabsValue
        var lowValue: Double = targetPoint.fabsValue
        if startPoint.fabsValue < targetPoint.fabsValue {
            highValue = targetPoint.fabsValue
            lowValue = startPoint.fabsValue
        }
        let distance = (highValue - lowValue).roundToSix()
        return distance
    } else {
        if startPoint.sign == false && targetPoint.sign == true {
            let distance = startPoint.fabsValue + targetPoint.fabsValue
            return distance
        } else if startPoint.sign == true && targetPoint.sign == false {
            let distance = (startPoint.fabsValue + targetPoint.fabsValue).roundToSix()
            return distance
        } else {
            var highValue: Double = startPoint.fabsValue
            var lowValue: Double = targetPoint.fabsValue
            if startPoint.fabsValue < targetPoint.fabsValue {
                highValue = targetPoint.fabsValue
                lowValue = startPoint.fabsValue
            }
            let distance = (highValue - lowValue).roundToSix()
            return distance
        }
    }
}
func distanceCenterPoint(_ centerPoint: PointInfoStruct,
                         andOtherPoints points: [PointInfoStruct]) -> ResultStruct? {
    var lowValue: ResultStruct?
    for point in points {
        if centerPoint.sign != point.sign || centerPoint.fabsValue != point.fabsValue {
            let distance = distancePointToPoint(centerPoint, point)
            let result = ResultStruct(centerPoint: centerPoint, anotherPoint: point, distance: distance)
            if lowValue == nil {
                lowValue = result
            } else {
                let compareValue = (lowValue?.distance)! > result.distance ? result: lowValue
                lowValue = compareValue
            }
        }
    }
    return lowValue
}
func getResults(_ points: [PointInfoStruct]) -> [ResultStruct] {
    var standardPoints = points
    standardPoints.removeLast()
    var targetPoints = points
    targetPoints.removeFirst()
    var results: [ResultStruct] = [ResultStruct]()
    for standardPoint in standardPoints {
        let result = distanceCenterPoint(standardPoint, andOtherPoints: targetPoints)
        targetPoints.removeFirst()
        results.append(result!)
    }
    return results
}

//// 여기서 원하는 숫자를 넣으면 됨
let points = [0, -9, -3.67, 5.78, 10.1, 9.0, -1.1, -2.2]
////
if points.count > 2 {
    let pointArray: [PointInfoStruct] =  makePoints(points)
    let results = getResults(pointArray)
    var sortedResults = results.sorted { (first, second) -> Bool in
        first.distance < second.distance
    }
    let lowResult = sortedResults.removeFirst()
    var equalDistanceResult: [ResultStruct] = [ResultStruct]()
    for result in sortedResults {
        if lowResult.distance == result.distance {
            equalDistanceResult.append(result)
        }
    }
    if equalDistanceResult.count == 0 {
        let centerPoint = "\(lowResult.centerPoint.sign == true ? "" : "-")" + "\(lowResult.centerPoint.fabsValue)"
        let anotherPoint = "\(lowResult.anotherPoint.sign == true ? "" : "-")" + "\(lowResult.anotherPoint.fabsValue)"
        print("가장 가까운 점은 \(centerPoint)와 \(anotherPoint)로 거리는 \(lowResult.distance)이다")
    } else {
        print("동일한 거리를 가지는 가까운 점이 \(equalDistanceResult.count + 1)개 있다.\n")
        let centerPoint = "\(lowResult.centerPoint.sign == true ? "" : "-")" + "\(lowResult.centerPoint.fabsValue)"
        let anotherPoint = "\(lowResult.anotherPoint.sign == true ? "" : "-")" + "\(lowResult.anotherPoint.fabsValue)"
        print("가장 가까운 점은 \(centerPoint)와 \(anotherPoint)로 거리는 \(lowResult.distance)이다.\n")
        for result in equalDistanceResult {
            let resultCPoint = "\(result.centerPoint.sign == true ? "" : "-")" + "\(result.centerPoint.fabsValue)"
            let resultAPoint = "\(result.anotherPoint.sign == true ? "" : "-")" + "\(result.anotherPoint.fabsValue)"
            print("가장 가까운 점은 \(resultCPoint)와 \(resultAPoint)로 거리는 \(result.distance)이다.\n")
        }
    }
} else {
    print("3개 이상의 숫자를 넣어주세요.")
}


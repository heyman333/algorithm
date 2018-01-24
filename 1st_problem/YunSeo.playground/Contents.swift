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
    var centerPointString: String
    var anotherPointString: String
    var distance: Double
}

var centerPoint = PointInfoStruct.init(-1)
var pointA = PointInfoStruct.init(3.5)
var pointB = PointInfoStruct.init(-4.2)
var pointC = PointInfoStruct.init(7)
var pointArray: [PointInfoStruct] = [pointA, pointB, pointC]

func distancePointToPoint(_ startPoint: PointInfoStruct, _ targetPoint: PointInfoStruct) -> Double {
    if startPoint.sign == true && targetPoint.sign == true {
        var highValue: Double = startPoint.fabsValue
        var lowValue: Double = targetPoint.fabsValue
        if startPoint.fabsValue < targetPoint.fabsValue {
            highValue = targetPoint.fabsValue
            lowValue = startPoint.fabsValue
        }
        let distance = highValue - lowValue
        return distance
    } else {
        if startPoint.sign == false && targetPoint.sign == true {
            let distance = startPoint.fabsValue + targetPoint.fabsValue
            return distance
        } else if startPoint.sign == true && targetPoint.sign == false {
            let distance = startPoint.fabsValue + targetPoint.fabsValue
            return distance
        } else {
            var highValue: Double = startPoint.fabsValue
            var lowValue: Double = targetPoint.fabsValue
            if startPoint.fabsValue < targetPoint.fabsValue {
                highValue = targetPoint.fabsValue
                lowValue = startPoint.fabsValue
            }
            let distance = highValue - lowValue
            return distance
        }
    }
}

func distanceCenterPoint(_ centerPoint: PointInfoStruct,
                         andOtherPoints points: [PointInfoStruct]) -> [Double: ResultStruct] {
    var resultDic: [Double: ResultStruct] = [Double: ResultStruct]()
    for point in points {
        let distance = distancePointToPoint(centerPoint, point)
        var centerPointString = "\(centerPoint.sign == true ? "":"-" )\(centerPoint.fabsValue)"
        if centerPointString == "-0.0" {
            centerPointString = "0.0"
        }
        let anotherPointString = "\(point.sign == true ? "":"-" )\(point.fabsValue)"
        let result = ResultStruct(centerPointString: centerPointString, anotherPointString: anotherPointString, distance: distance)
        resultDic[distance] = result
    }
    return resultDic
}

func whatIsNearPoint(_ results: [Double: ResultStruct]) {
    var keyValues: [Double] = [Double]()
    for result in results {
        keyValues.append(result.key)
    }
    let minValue = keyValues.min()
    print("기준점: \(results[minValue!]?.centerPointString ?? "오류"),\n가장 가까운점: \(results[minValue!]?.anotherPointString ?? "오류")")
}

let resluts = distanceCenterPoint(centerPoint, andOtherPoints: pointArray)
whatIsNearPoint(resluts)

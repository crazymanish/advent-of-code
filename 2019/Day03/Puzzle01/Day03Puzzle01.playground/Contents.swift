import Foundation
import CoreGraphics

extension CGPoint {
    func add(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: x + point.x, y: y + point.y)
    }

    func manhattanDistance(_ to: CGPoint) -> Int {
        return Int((abs(x - to.x) + abs(y - to.y)))
    }
}

fileprivate extension String {
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }

    var point: CGPoint {
        let direction = prefix(1)
        let distance = Int(self[1..<count])!

        switch direction {
        case "R": return CGPoint(x: distance, y: 0)
        case "L": return CGPoint(x: -distance, y: 0)
        case "U": return CGPoint(x: 0, y: distance)
        case "D": return CGPoint(x: 0, y: -distance)
        default: return .zero
        }
    }
}

fileprivate extension Array where Element == String {
    var points: [CGPoint] {
        var currentPoint = CGPoint.zero
        var points: [CGPoint] = [currentPoint]

        for string in self {
            let point = string.point
            let endPoint = currentPoint.add(point)
            points.append(endPoint)
            currentPoint = endPoint
        }

        return points
    }
}

func linesCross(start1: CGPoint, end1: CGPoint, start2: CGPoint, end2: CGPoint) -> CGPoint? {
    // calculate the differences between the start and end X/Y positions for each of our points
    let delta1x = end1.x - start1.x
    let delta1y = end1.y - start1.y
    let delta2x = end2.x - start2.x
    let delta2y = end2.y - start2.y

    // create a 2D matrix from our vectors and calculate the determinant
    let determinant = delta1x * delta2y - delta2x * delta1y

    if abs(determinant) < 0.0001 {
        // if the determinant is effectively zero then the lines are parallel/colinear
        return nil
    }

    // if the coefficients both lie between 0 and 1 then we have an intersection
    let ab = ((start1.y - start2.y) * delta2x - (start1.x - start2.x) * delta2y) / determinant

    if ab > 0 && ab < 1 {
        let cd = ((start1.y - start2.y) * delta1x - (start1.x - start2.x) * delta1y) / determinant

        if cd > 0 && cd < 1 {
            // lines cross – figure out exactly where and return it
            let intersectX = start1.x + ab * delta1x
            let intersectY = start1.y + ab * delta1y
            return CGPoint(x: intersectX, y: intersectY)
        }
    }

    // lines don't cross
    return nil
}


let wires = input.components(separatedBy: "\n").filter { $0 != "" }
let firstWire = wires.first!.components(separatedBy: ",").points
let secondWire = wires.last!.components(separatedBy: ",").points

var minimumManhattanDistance = INTPTR_MAX

for index in 0...firstWire.count-2 {
    let start1 = firstWire[index]
    let end1 = firstWire[index+1]

    for index1 in 0...secondWire.count-2 {
        let start2 = secondWire[index1]
        let end2 = secondWire[index1+1]

        if let point = linesCross(start1: start1, end1: end1, start2: start2, end2: end2) {
            let manhattanDistance = CGPoint.zero.manhattanDistance(point)

            minimumManhattanDistance = manhattanDistance < minimumManhattanDistance ? manhattanDistance : minimumManhattanDistance
        }
    }
}

print(minimumManhattanDistance)

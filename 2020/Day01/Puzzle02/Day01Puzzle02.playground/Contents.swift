import Foundation

let numbers = input.components(separatedBy: "\n")
    .filter { $0 != "" }
    .map{ Int($0)! }


func findPairs(for input: Int, from numbers: [Int]) -> (Int, Int) {
    var pairs: [Int: Int] = [:]

    for number in numbers {
        pairs[number] = number
        let remainingNumber = input - number
        
        if let oldNumber = pairs[remainingNumber], (oldNumber + number) == input {
            return (oldNumber, number)
        }
    }
    
    return (0, 0)
}

func find3ValuePairs(for input: Int, from numbers: [Int]) -> (Int, Int, Int) {
    var pairs: [Int: Int] = [:]

    var index = 0
    for number in numbers {
        index += 1
        print(index)
        
        pairs[number] = number
        let remainingNumber = input - number
        let remainingNumberPair = findPairs(for: remainingNumber, from: Array(pairs.keys))
        
        if (remainingNumberPair.0 + remainingNumberPair.1 + number) == input {
            return (remainingNumberPair.0, remainingNumberPair.1 ,number)
        }
    }
    
    fatalError("This should not happen")
}

let pairs = find3ValuePairs(for: 2020, from: numbers)
let output = pairs.0 * pairs.1 * pairs.2
print(output)

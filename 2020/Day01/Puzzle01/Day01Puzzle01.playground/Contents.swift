import Foundation

let numbers = input.components(separatedBy: "\n")
    .filter { $0 != "" }
    .map{ Int($0)! }


func findPairs(for input: Int, from numbers: [Int]) -> (Int, Int) {
    var pairs: [Int: Int] = [:]

    for number in numbers {
        pairs[number] = number
        let remainingNumber = 2020 - number
        
        if let oldNumber = pairs[remainingNumber], (oldNumber + number) == 2020 {
            return (oldNumber, number)
        }
    }
    
    fatalError("this should not expected.")
}

let pairs = findPairs(for: 2020, from: numbers)
let output = pairs.0 * pairs.1
print(output)

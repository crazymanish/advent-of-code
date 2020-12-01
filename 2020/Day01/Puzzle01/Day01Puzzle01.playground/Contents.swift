import Foundation

let numbers = input.components(separatedBy: "\n")
    .filter { $0 != "" }
    .map{ Int($0)! }

print(numbers)

var pairs: [Int: Int] = [:]
var output = 0

for number in numbers {
    pairs[number] = number
    let remainingNumber = 2020 - number
    
    if let oldNumber = pairs[remainingNumber], (oldNumber + number) == 2020 {
        output = remainingNumber * number
        break
    }
}

print(output)

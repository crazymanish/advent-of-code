import Foundation

enum Opcode: Int64 {
    case add = 1
    case multiply = 2
    case halt = 99

    func performOperation(_ param1: Int64, _ param2: Int64) -> Int64? {
        switch self {
        case .add: return param1 + param2
        case .multiply: return param1 * param2
        case .halt: return nil
        }
    }
}

var inputs = input.replacingOccurrences(of: "\n", with: "")
    .components(separatedBy: ",")
    .filter { $0 != "" }
    .map{ Int64($0)! }

//To do this, before running the program, replace position 1 with the value 12 and replace position 2 with the value 2.
inputs[1] = 12
inputs[2] = 2

let forwardRange = 4
var currentPosition = 0
while currentPosition + forwardRange < inputs.count  {
    let opCode = Opcode(rawValue: inputs[currentPosition])!
    let firstIndex = Int(inputs[currentPosition+1])
    let secondIndex = Int(inputs[currentPosition+2])
    guard let result = opCode.performOperation(inputs[firstIndex], inputs[secondIndex]) else { break }

    let outputIndex = Int(inputs[currentPosition+3])
    inputs[outputIndex] = result

    currentPosition += forwardRange
}

print(inputs)

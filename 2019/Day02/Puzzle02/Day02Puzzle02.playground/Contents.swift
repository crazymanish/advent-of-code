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

var programInputs: [Int64] {
    input.replacingOccurrences(of: "\n", with: "")
        .components(separatedBy: ",")
        .filter { $0 != "" }
        .map{ Int64($0)! }
}


func run(with programInputs: [Int64]) -> Int64 {
    let forwardRange = 4
    var inputs = programInputs
    var currentPosition = 0
    while currentPosition + forwardRange < inputs.count  {
        let opCode = Opcode(rawValue: inputs[currentPosition])!
        let firstIndex = Int(inputs[currentPosition+1])
        let secondIndex = Int(inputs[currentPosition+2])
        guard let result = opCode.performOperation(inputs[firstIndex], inputs[secondIndex]) else { return inputs[0] }

        let outputIndex = Int(inputs[currentPosition+3])
        inputs[outputIndex] = result

        currentPosition += forwardRange
    }

    return inputs[0]
}


for index in 0...99 {
    for index2 in 0...99 {
        var inputs = programInputs
        inputs[1] = Int64(index)
        inputs[2] = Int64(index2)

        let output = run(with: inputs)

        if output == 19690720 {
            print(100 * index + index2)
            exit(0)
        }
    }
}

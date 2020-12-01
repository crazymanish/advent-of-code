import Foundation

extension StringProtocol  {
    var digits: [Int] { compactMap{ $0.wholeNumberValue } }
}
extension LosslessStringConvertible {
    var string: String { .init(self) }
}
extension Numeric where Self: LosslessStringConvertible {
    var digits: [Int] { string.digits }
}

extension Int64 {
    var matchRules: Bool {
        let input = digits
        let output = stride(from: 0, to: input.count - 1, by: 1).map{(input[$0], input[$0 + 1])}
        let differences = output.map({ $0.1 - $0.0 })

        return !differences.filter({$0 == 0}).isEmpty && differences.filter({$0 < 0}).isEmpty
    }
}

let inputs = input.replacingOccurrences(of: "\n", with: "")
    .components(separatedBy: "-")
    .filter { $0 != "" }
    .map { Int64($0)! }

var output: Int = 0

for number in inputs[0]...inputs[1] {
    if number.matchRules { output += 1 }
}

print(output)

import Foundation

let inputs = input.replacingOccurrences(of: "\n", with: "")
    .components(separatedBy: ",")
    .filter { $0 != "" }
    .map { Int64($0)! }

print(inputs)

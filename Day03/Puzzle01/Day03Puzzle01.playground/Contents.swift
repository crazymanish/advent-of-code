import Foundation

var inputs = input.replacingOccurrences(of: "\n", with: "")
    .components(separatedBy: ",")
    .filter { $0 != "" }

print(inputs)

import Foundation

let modules = input.components(separatedBy: "\n")
    .filter { $0 != "" }
    .map{ Double($0)! }

var fuelRequired: Int64 = 0

for module in modules {
    fuelRequired += Int64(module / 3) - 2
}

print(fuelRequired)

import Foundation

extension Double {
    var fuel: Int64 { Int64(self / 3) - 2 }
}

let modules = input.components(separatedBy: "\n")
    .filter { $0 != "" }
    .map{ Double($0)! }

var fuelRequired: Int64 = 0

for module in modules {
    var currentModule = module

    while currentModule.fuel > 0 {
        fuelRequired += currentModule.fuel
        currentModule = Double(currentModule.fuel)
    }
}

print(fuelRequired)

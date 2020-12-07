import Foundation

extension String {    
    var bag: String {
        var inputs = self.components(separatedBy: " ")
        inputs.remove(at: 0)
        let output = inputs.joined()
        
        return output
    }
    
    var bags: [String] {
        let inputs = self.components(separatedBy: ", ")
            .map { $0.replacingOccurrences(of: "( bags.| bags| bag.| bag)", with: "", options: .regularExpression) }
            .map { $0.bag }
        
        return inputs
    }
}

let inputs = input.components(separatedBy: "\n")
    .filter { $0 != "" }
    .map { $0.components(separatedBy: " bags contain ") }
    .map { [$0[0].components(separatedBy: " ").joined(): $0[1].bags] }

var colors: [String] = []
func find(string: String) {
    let output = inputs.filter { !($0.values.filter({ $0.contains(string) })).isEmpty }
    if !output.isEmpty{
        output.flatMap { $0.keys }.map {
            if !colors.contains($0) {
                colors.append($0)
                find(string: $0)
            }
        }
    }
}


find(string: "shinygold")
print(colors.count)

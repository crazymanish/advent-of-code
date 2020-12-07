import Foundation

extension String {
    var bag: (String, Int) {
        var inputs = self.components(separatedBy: " ")
        let number = Int(inputs[0]) ?? 0
        inputs.remove(at: 0)
        let output = inputs.joined()

        return (output, number)
    }

    var bags: [String: Int] {
        var pairs1 = [String: Int]()
        self.components(separatedBy: ", ")
            .map { $0.replacingOccurrences(of: "( bags.| bags| bag.| bag)", with: "", options: .regularExpression) }
            .map { pairs1[$0.bag.0] = $0.bag.1 }

        return pairs1
    }
}

var pairs = [String: [String: Int]]()
input.components(separatedBy: "\n")
    .filter { $0 != "" }
    .map { $0.components(separatedBy: " bags contain ") }
    .map {
        let key = $0[0].components(separatedBy: " ").joined()
        pairs[key] = $0[1].bags
    }


func totalBags(string: String) -> Int {
    let values = pairs[string]
    guard values != nil else {
        return 0
    }

    let outputs = values!.keys.map {
        values![$0]! + values![$0]! * totalBags(string: $0)
    }
    
    return outputs.reduce(0, +)
}

let output = totalBags(string: "shinygold")
print(output)

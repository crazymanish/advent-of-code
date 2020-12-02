import Foundation

let inputs = input.components(separatedBy: "\n")
    .filter { $0 != "" }
    .map { $0.components(separatedBy: " ") }

extension String {
    func char(at position: Int) -> Character {
        let stringIndex = index(startIndex, offsetBy: position - 1)
        return self[stringIndex]
    }
}

func checkForValidPassword(input: [String]) -> Bool {
    let repeatCharRange = input[0]
        .components(separatedBy: "-")
        .map { Int($0)! }
    
    var repeatedCharString = input[1]
    let repeatedChar = repeatedCharString.removeFirst()
    
    var repeatedCharCount = 0
    if input[2].char(at: repeatCharRange[0]) == repeatedChar { repeatedCharCount += 1 }
    if input[2].char(at: repeatCharRange[1]) == repeatedChar { repeatedCharCount += 1 }

    return repeatedCharCount == 1
}

var validPasswordsCount = 0
for input in inputs {
    if checkForValidPassword(input: input) { validPasswordsCount += 1 }
}
print(validPasswordsCount)

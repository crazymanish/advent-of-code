import Foundation

let inputs = input.components(separatedBy: "\n")
    .filter { $0 != "" }
    .map { $0.components(separatedBy: " ") }

func checkForValidPassword(input: [String]) -> Bool {
    let repeatCharRange = input[0]
        .components(separatedBy: "-")
        .map { Int($0)! }
    
    var repeatedCharString = input[1]
    let repeatedChar = repeatedCharString.removeFirst()
    
    var repeatedCharCount = 0
    for char in input[2] {
        if char == repeatedChar { repeatedCharCount += 1 }
    }
    
    return repeatedCharCount >= repeatCharRange[0] && repeatedCharCount <= repeatCharRange[1]
}

var validPasswordsCount = 0
for input in inputs {
    if checkForValidPassword(input: input) { validPasswordsCount += 1 }
}
print(validPasswordsCount)

import Foundation

//let inputs = input.components(separatedBy: "\r\n")

var inputs: [[String: String]] = []
var linePairs: [String: String] = [:]
var validPassportCount = 0
input.enumerateLines { (line, _) -> () in
    line.isEmpty ? print("🙈") : print(line)
    
    if line.isEmpty {
        inputs.append(linePairs)
        
        if linePairs["byr"] != nil &&
            linePairs["iyr"] != nil &&
            linePairs["eyr"] != nil &&
            linePairs["hgt"] != nil &&
            linePairs["hcl"] != nil &&
            linePairs["ecl"] != nil &&
            linePairs["pid"] != nil {
                validPassportCount += 1
            }
        
        linePairs = [:]
    } else {
        let _ = line.components(separatedBy: " ")
            .map {
                let pair = $0.components(separatedBy: ":")
                linePairs[pair[0]] = pair[1]
            }
            
        
    }
}

inputs.append(linePairs)

if linePairs["byr"] != nil &&
    linePairs["iyr"] != nil &&
    linePairs["eyr"] != nil &&
    linePairs["hgt"] != nil &&
    linePairs["hcl"] != nil &&
    linePairs["ecl"] != nil &&
    linePairs["pid"] != nil {
        validPassportCount += 1
    }

linePairs = [:]

print(inputs.count)
print(validPassportCount)

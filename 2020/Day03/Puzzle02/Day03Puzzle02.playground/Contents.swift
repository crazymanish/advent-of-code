import Foundation

let inputs = input.components(separatedBy: "\n")
    .filter { $0 != "" }

let charsByLine: [[Character]] = inputs.map { Array($0) }

func findTrees(offset: (x: Int, y: Int)) -> Int {
  let forest = charsByLine

  var position = (x: 0, y: 0)
  var treeCount = 0

  while position.x < forest.count {
    let result = forest[position.x][position.y]
    treeCount += (result == "#" ? 1 : 0)
    position = (position.x + offset.x, (position.y + offset.y) % forest[0].count)
  }

  return treeCount
}

let offsets = [
      (x: 1, y: 1),
      (x: 1, y: 3),
      (x: 1, y: 5),
      (x: 1, y: 7),
      (x: 2, y: 1)
    ]

let outputs = offsets.map(findTrees)
let output = outputs.reduce(1) { $0 * $1 }
print(output)

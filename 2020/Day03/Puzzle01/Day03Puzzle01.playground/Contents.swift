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

let output = findTrees(offset: (x: 1, y: 3))
print(output)

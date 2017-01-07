//: [Previous](@previous)


typealias ValueAtCoord = [Int: [Int: String]]

var grid: [Int: [Int: String]] = [:]


grid[1] = [1: "1x1"]

let bottomRight = grid[grid.count]?.count

func getValueAtCoord(x: Int, y: Int) -> String {

  if let value = grid[x]?[y] {
    return value
  } else { return "no value"}
}

// Need blank spaces

func addItemToRight(atY y: Int) -> Bool {

  
  
  return false
}

func addItemBelow(atX x: Int) -> Bool {

  
  
  return false
}

// print(getValueAtCoord(x: 1, y: 1))
// need a max width in between... not possible ;{
// just need boundaries
// add to right, then split the difference


/*
 
_-X-_ _-X-_ _-X-_    _-X-_       1
  |            \      /|\
  c             c    c c c       2
                |   /  |  \
               -x--x- -x- -x-    3
                   |
                   c             4
                   |
                  -x-            5

*/

var h = "hello"
h.moveRight(spaces: 4)
print (h)
//: [Next](@next)

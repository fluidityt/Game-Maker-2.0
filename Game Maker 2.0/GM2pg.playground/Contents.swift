struct Checkerboard {
 
  enum Square: String {
    case empty = "▪️"
    case red   = "🔴"
    case white = "⚪️"
  }
 
  typealias Coordinate = (x: Int, y: Int)
 
  fileprivate var squares: [[Square]] = [
    [ .empty, .red,   .empty, .red,   .empty, .red,   .empty, .red   ],
    [ .red,   .empty, .red,   .empty, .red,   .empty, .red,   .empty ],
    [ .empty, .red,   .empty, .red,   .empty, .red,   .empty, .red   ],
    [ .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty ],
    [ .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty ],
    [ .white, .empty, .white, .empty, .white, .empty, .white, .empty ],
    [ .empty, .white, .empty, .white, .empty, .white, .empty, .white ],
    [ .white, .empty, .white, .empty, .white, .empty, .white, .empty ]
  ]
 
  subscript(coordinate: Coordinate) -> Square {
    get {
      return squares[coordinate.y][coordinate.x]
    }
    set {
      squares[coordinate.y][coordinate.x] = newValue
    }
  }
}
 
extension Checkerboard: CustomStringConvertible {
 
  var description: String {
    return squares.map { row in row.map { $0.rawValue }.joined(separator: "") }
        .joined(separator: "\n") + "\n"
  }
}

// print(Checkerboard().description)
/*
var grid=[[String]]()

print( grid.append(["hi"]) )
print( grid[0])
*/
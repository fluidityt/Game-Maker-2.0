import SpriteKit


extension String {
  public mutating func moveRight(spaces: Int) {
    
    var xspaces = ""
    for _ in 0...spaces {
      xspaces += " "
    }
    self = xspaces + "hi"
  }
}

public func grid() {

  
}


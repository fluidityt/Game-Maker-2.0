import SpriteKit
import PlaygroundSupport


/// Addbox + Makesprite:
final class Tester: SKScene {
  
  func addBox(toNode: SKNode) -> SKSpriteNode {
    let box = SKSpriteNode(color: .black, size: CGSize(width: 10, height: 10))
    box.zPosition = 5
    box.name = "box"
    
    addChild(box)
    
    if let theParent = toNode.parent {
      box.position = convert(toNode.frame.centerLeft, from: theParent)
    } else { box.position = toNode.frame.centerLeft }
    
    return box
  }
  
  func makeSprite(color: SKColor,
                          name: String,
                          theParent: SKNode) -> SKSpriteNode {
    
    let returner = SKSpriteNode(color: color, size: CGSize(width: 25, height: 25))
    returner.name = name
    
    theParent.addChild(returner)
    returner.position.y -= 35
    
    return returner
  }
}

/// Overlap + Algo:
extension Tester {
  
  func overlappingCheck(noded: SKNode, bkg: SKNode) -> (result: Bool, node: SKNode?) {
    
    guard let theParent = noded.parent else { fatalError("no parent") }
  
    checkInside: do {
      let rangeLeft  = convert(noded.frame.centerLeft,  from: theParent).x
      let rangeRight = convert(noded.frame.centerRight, from: theParent).x
      let yVal       = convert(noded.frame.center,      from: theParent).y
      
      let resetToThisPosition = noded.zPosition
      noded.zPosition = -500
      
      var ticker = rangeLeft
      repeat {
        ticker += 1
        /// print(atPoint( CGPoint(x: ticker, y: yVal) ).name)
      } while (ticker != rangeRight) && (atPoint(CGPoint(x: ticker, y: yVal)) == bkg)
      
      noded.zPosition = resetToThisPosition
    }
    
    checkRight: do {
      var pos1 = convert(noded.frame.centerRight, from: theParent) /// Start at right border.
      pos1.x += 1                                                  /// Check to the right.
      if atPoint(pos1) != noded {
        if atPoint(pos1) == bkg { break checkRight } else { return (true, atPoint(pos1)) }
      }
    }
    
    checkLeft: do {
      var pos2 = convert(noded.frame.centerLeft, from: theParent) /// Continue at left border
      pos2.x -= 1                                                 /// Check to the left.
      if atPoint(pos2) != noded {
        if atPoint(pos2) == bkg { break checkLeft } else { return (true, atPoint(pos2)) }
      }
    }
    
    edgeCase: do {
      /// FIXME: Add this where if they are exactly on top of each other.. shift out a bit :P
    }
    
    print("found nothing")
    return (false, nil)
  }
  
  /// Make sure superParent is correct:
  func moveAlgo(collidedNode: SKNode, superParent: SKNode) {
    
    print("collided node:", collidedNode.name!)
    
    var returner = SKNode()
    
    /// Find the next-highest parent:
    func highestParent(ofChildNode: SKNode) -> SKNode {
      
      
      guard let theParent = ofChildNode.parent else { fatalError("no parent") }
      print("-- hp -- parent:", theParent.name!)
      
      if theParent.name! == superParent.name! {
        returner = ofChildNode
      } else { highestParent(ofChildNode: theParent) }
      
      return returner
    }
    
    print( "-- al -- highest parent of \(collidedNode.name!):", highestParent(ofChildNode: collidedNode).name! )
    
    /// Find distance to move it: ... array sort ...
    
  }
  
  func overlappingTest() {
    
    /// Background:
    let bkg = SKSpriteNode(color: .gray, size: self.size)
    addChild(bkg)
    bkg.zPosition = -1
    bkg.name = "bkg"
    
    /// Creation: (take note of parents!)
    let n1 = makeSprite(color: .cyan, name: "n1", theParent: self),
        n2 = makeSprite(color: .red,  name: "n2", theParent: n1  ),
        n3 = makeSprite(color: .cyan, name: "n3", theParent: n2  )
        
    let o1 = makeSprite(color: .cyan, name: "o1", theParent: self),
        o2 = makeSprite(color: .red,  name: "o2", theParent: o1  ),
        o3 = makeSprite(color: .cyan, name: "o3", theParent: o2  ),
        
        box = addBox(toNode: self),
        o3sibling = makeSprite(color: .cyan, name: "o3sibling", theParent: o2)
    
    /// Spacing:
    o1.position.x += 35
    o3.position.x += 18
    o3sibling.position.x -= 17
    
    /// Tester:
    print("checking collision for o3sibling")
    let overlapped = overlappingCheck(noded: o3sibling, bkg: bkg)
    
    if overlapped.result == true {
      moveAlgo(collidedNode: overlapped.node!, superParent: o1)
    }
    
  }
  
  func overlappingTest2() {
    
    /// Creation: (take note of parents!)
    let bkg = SKSpriteNode(color: .gray, size: self.size),
        box = addBox(toNode: self),
    
        n1 = makeSprite(color: .cyan, name: "n1", theParent: self),
        n2 = makeSprite(color: .red,  name: "n2", theParent: n1  ),
        n3 = makeSprite(color: .cyan, name: "n3", theParent: n2  ),
    
        o1 = makeSprite(color: .cyan, name: "o1", theParent: self),
        o2 = makeSprite(color: .red,  name: "o2", theParent: o1  ),
        o3 = makeSprite(color: .cyan, name: "o3", theParent: o2  ),
    
        o3sibling = makeSprite(color: .cyan, name: "o3sibling", theParent: o2)
    
    setup: do {
      /// Spacing:
      o1.position.x += 35
      o3.position.x += 18
      o3sibling.position.x -= 17
      
      /// Background:
      addChild(bkg)
      bkg.zPosition = -1
      bkg.name = "bkg"
    }
    
    overlappingCheck(noded: o3sibling, bkg: bkg)
  }
}

/// Sorting array stuff:
extension Tester {

  
  
  func sort(node: SKNode) {
    
    let theParent: SKNode
    
    find: do {
      theParent = node.parent!
    }
    
    draw: do {
      
    }
    
  }
  
  func sortTest() {
    
    /// Creation: (take note of parents!)
    let bkg = SKSpriteNode(color: .gray, size: self.size),
        box = addBox(toNode: self),
    
        o1 = makeSprite(color: .cyan, name: "o1", theParent: self),
        o2 = makeSprite(color: .red,  name: "o2", theParent: o1  ),
        o3 = makeSprite(color: .cyan, name: "o3", theParent: o2  ),
    
        o3sibling = makeSprite(color: .cyan, name: "o3sibling", theParent: o2),
        o3sibSib  = makeSprite(color: .cyan, name: "o3sibSib" , theParent: o2)
    
    setup: do {
      /// Spacing:
      o1.position.x += 35
      o3.position.x += 28
      o3sibling.position.x -= 27
      
      /// Background:
      addChild(bkg)
      bkg.zPosition = -1
      bkg.name = "bkg"
    }

    
  }
}

/// DMV + TB:
extension Tester {
  
  override func didMove(to view: SKView) {
    sortTest()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    SOlution: do {
      let touch = touches.first
      
      let positionInScene = touch!.location(in: self)
      
      let allNodes = nodes(at: positionInScene)
      
      for node in allNodes {
        
        let nodePositionConverted = self.convert(node.position, from: node)
        
        let nodeFrameConverted
          = CGRect(origin: CGPoint(x: nodePositionConverted.x - node.frame.maxX,
                                   y: nodePositionConverted.y - node.frame.maxY),
                   size: node.frame.size)
        
        /// Filter:
        if nodeFrameConverted.contains(positionInScene), let n = node.name {
          print(n)
        }
      }
    }
  }
} /// EoC


PlaygroundPage.current.liveView = Util.loadScene(Tester(size: CGSize(width: 400, height: 450)))

func shittystuff() {
  var top = Util.buildPrompt(),
  topChildren = [Util.buildChoice(), Util.buildChoice()],
  
  second = [Util.buildPrompt(), Util.buildPrompt()],
  secondChildren = [[Util.buildChoice(),Util.buildChoice()],
                    [Util.buildChoice()]]

    junk: do {
      //addBox(toNode: o3sibling)
      
      /*  addStuff: do {
       /// Top:
       addChild(top)
       
       /// TopC:
       for child in topChildren { top.addChild(child) }
       
       /// Seconds:
       var counter = -1
       while counter != (topChildren.count - 1) {
       counter += 1
       topChildren[counter].addChild( second[counter] )
       }
       
       /// SecondsC:
       counter = -1
       while counter != (second.count - 1) {
       counter += 1
       for child in secondChildren[counter] { second[counter].addChild(child) }
       }
       }
       */
    }
    
    shit: do { /*
       let conTop1 = convert(top.position, to: self),  /// top: 0, 0  ; self: 0, -35
       conTop2 = convert(top.position, from: self) /// top: 0, -70; self: 0, -35
       
       let conTop3 = convertPoint(toView: top.position), /// 200, 274
       conTop4 = convertPoint(fromView: top.position)/// -160, 184
       */
    }
  }

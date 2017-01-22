import SpriteKit
import PlaygroundSupport


final class Tester: SKScene {
  
  var top = Util.buildPrompt(),
      topChildren = [Util.buildChoice(), Util.buildChoice()],
      
      second = [Util.buildPrompt(), Util.buildPrompt()],
      secondChildren = [[Util.buildChoice(),Util.buildChoice()],
                        [Util.buildChoice()]]
      
  private func addBox(toNode: SKNode) -> SKSpriteNode {
    let box = SKSpriteNode(color: .black, size: CGSize(width: 10, height: 10))
    box.zPosition = 5
    box.name = "box"
    
    addChild(box)
    
    if let theParent = toNode.parent {
      box.position = convert(toNode.frame.centerLeft, from: theParent)
    } else { box.position = toNode.frame.centerLeft }
    
    return box
  }
  
  private func makeSprite(color: SKColor,
                          name: String,
                          theParent: SKNode) -> SKSpriteNode {
    
    let returner = SKSpriteNode(color: color, size: CGSize(width: 25, height: 25))
    returner.name = name
    
    theParent.addChild(returner)
    returner.position.y -= 35
    
    return returner
  }
  
  private func isOverlapping(noded: SKNode) -> Bool {
    
    checkRight: do {
      var pos1 = convert(noded.frame.centerRight, from: noded.parent!) /// Start at right border.
      pos1.x += 1                                                  /// Check to the right.
      if atPoint(pos1) != noded {
        if atPoint(pos1) == bkg { break checkRight } else { return true }
      }
    }
    
    checkLeft: do {
      pos1 = convert(noded.frame.centerLeft, from: noded.parent!) /// Continue at left border.
      pos1.x -= 1                                                 /// Check to the left.
      if atPoint(pos1) != noded {
        if atPoint(pos1) == bkg { break checkLeft } else { return true }
      }
    }
    
    edgeCase: do {
      /// FIXME: Add this where if they are exactly on top of each other.. shift out a bit :P
    }
    
    return false
  }
  
  override func didMove(to view: SKView) {
    
    
    goodStuff: do {
      
       let n1 = makeSprite(color: .cyan, name: "n1", theParent: self),
       n2 = makeSprite(color: .red, name: "n2", theParent: n1),
       n3 = makeSprite(color: .cyan, name: "n3", theParent: n2)
 
      
      /// Background:
      let bkg = SKSpriteNode(color: .gray, size: self.size)
      addChild(bkg)
      bkg.zPosition = -1
      bkg.name = "bkg"
      
      /// Creation: (take note of parents!)
      let o1        = makeSprite(color: .cyan, name: "o1",        theParent: self),
          o2        = makeSprite(color: .red,  name: "o2",        theParent: o1),
          o3        = makeSprite(color: .cyan, name: "o3",        theParent: o2),
          o3sibling = makeSprite(color: .cyan, name: "o3sibling", theParent: o2),
          
          box       = addBox(toNode: self)
      
      /// Spacing:
      o1.position.x += 35
      o3.position.x += 18
      o3sibling.position.x -= 17
      
      /// Tester:

      
      print( isOverlapping(noded: o3sibling) )
      
    }
    
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
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    craptard: do {
      let preciseLocation = touches.first!.preciseLocation(in: self.view!)
      
      let convPLoc = convertPoint(fromView: preciseLocation)
      let frame = atPoint(convPLoc).frame
      
      for node in nodes(at: convPLoc) {
        if frame.intersects(node.frame) { print("hi") }
      }
      //      print(preciseLocation, convPLoc)
      
      print("\n")
    }
    
    SOlution: do {/*
       let touch = touches.first
       
       let positionInScene = touch!.location(in: self)
       
       let allNodes = nodes(at: positionInScene)
       
       for node in allNodes {
       
       let nodePositionConverted = self.convert(node.position, from: node)
       
       let nodeFrameConverted
       = CGRect(origin: CGPoint(x: nodePositionConverted.x - node.frame.maxX,
       y: nodePositionConverted.y - node.frame.maxY),
       size: node.frame.size)
       
       if nodeFrameConverted.contains(positionInScene), let n = node.name {
       print(n)
       }
       }*/
    }
    
  }
  
  private func algo() {
    var isOverlapped = true
    /// Recursive:
    func checkIt(node: SKNode) {
      if isOverlapped { checkIt(node: node) }
    }
  }
}


PlaygroundPage.current.liveView = Util.loadScene(Tester(size: CGSize(width: 400, height: 450)))


import SpriteKit
import PlaygroundSupport


final class Tester: SKScene {
  
  let top = Util.buildPrompt(),
  topChildren = [Util.buildChoice(), Util.buildChoice()],
  
  second = [Util.buildPrompt(), Util.buildPrompt()],
  secondChildren = [[Util.buildChoice(),Util.buildChoice()],
                    [Util.buildChoice()]]
  
  private func addBox(toNode: SKNode) -> SKSpriteNode {
    let box = SKSpriteNode(color: .black, size: CGSize(width: 10, height: 10))
    box.zPosition = 5
    box.name = "box"
    
    addChild(box)
    box.position = toNode.position
    
    if let theParent = toNode.parent {
      box.position = convert(toNode.position, from: theParent)
    } else { box.position = toNode.position }
    
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
  
  override func didMove(to view: SKView) {
  
    /*
    let n1 = makeSprite(color: .cyan, name: "n1", theParent: self),
        n2 = makeSprite(color: .red, name: "n2", theParent: n1),
        n3 = makeSprite(color: .cyan, name: "n3", theParent: n2)
    */
    
    // Creation:
    let o1        = makeSprite(color: .cyan, name: "o1", theParent: self),
        o2        = makeSprite(color: .red,  name: "o2",        theParent: o1),
        o3        = makeSprite(color: .cyan, name: "o3",        theParent: o2),
        o3sibling = makeSprite(color: .cyan, name: "o3sibling", theParent: o2)
    
    // Spacing:
    o1.position.x += 35
    o3.position.x += 18
    o3sibling.position.x -= 17
    
    let box = addBox(toNode: o3sibling)
    

    print("box:", box.position)
    print("o3sibling:", o3sibling.position)
    print("o1:", o1.position)
    print("o2:", o2.position)
    
     for node in nodes(at: box.position) {
      print( node.name )
    }
    
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
     }*/
    
    shit: do {
      let conTop1 = convert(top.position, to: self),  /// top: 0, 0  ; self: 0, -35
      conTop2 = convert(top.position, from: self) /// top: 0, -70; self: 0, -35
      
      let conTop3 = convertPoint(toView: top.position), /// 200, 274
      conTop4 = convertPoint(fromView: top.position)/// -160, 184
    }
    
    
  }
  
  private func algo() {
    
    var isOverlapped = true
    
    /// Recursive:
    func checkIt(node: SKNode) {
      
      if isOverlapped { checkIt(node: node) }
      
    }
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    do {
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
      }
    }
  }
}


PlaygroundPage.current.liveView = Util.loadScene(Tester(size: CGSize(width: 320, height: 320)))


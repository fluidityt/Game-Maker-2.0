//: [Previous](@previous)

import SpriteKit
import PlaygroundSupport
extension CGRect {
  var center:      CGPoint { return CGPoint(x: midX, y: midY) }
  var centerLeft:  CGPoint { return CGPoint(x: minX, y: midY) }
  var centerRight: CGPoint { return CGPoint(x: maxX, y: midY) }
  
  var bottomLeft:  CGPoint { return CGPoint(x: minX, y: minY) }
  var bottomRight: CGPoint { return CGPoint(x: maxX, y: minY) }
  var topLeft:     CGPoint { return CGPoint(x: minX, y: maxY) }
  var topRight:    CGPoint { return CGPoint(x: maxX, y: maxX) }
}

enum Util {
  
  static func buildPrompt() -> SKSpriteNode {
    
    let ret = SKSpriteNode(color: .yellow, size: CGSize(width: 25, height: 25))
    ret.position.y -= 35
    return ret
  }
  
  static func buildChoice() -> SKSpriteNode {
    let ret = SKSpriteNode(color: .green, size: CGSize(width: 25, height: 25))
    ret.position.y -= 35
    return ret
  }
  
  static func addChoice(to parent: SKSpriteNode) {
    let new = buildChoice()
    parent.addChild(new)
    new.position.y -= 35
    
    var needsSpacing = false
    if parent.children.count > 1 { needsSpacing = true }
    
    if needsSpacing {
      // get maximum size of new box:
      let size = (10 * parent.children.count) + (25 * parent.children.count)
      
      // build a placer node. go up to the previous choice check if it's the last index, if not, move last index over
      
    }
    func alignToParent() {}   // Evens out choices under parent.
    func spaceOut() {}        // Moves everything over to the right.
    
  }
  
  static func spaceOutChildren(children: [SKSpriteNode]) {
    
    func getMiddleNumber(number: Int) -> Int { return ((number - 1) / 2) + 1 }
    
    func isEven(_ amount: Int) -> Bool { if amount % 2 == 0 { return true } else { return false }}
    
    if isEven(children.count) {
      let amountTotal = CGFloat(25 * children.count)
      let amountPer   = CGFloat(amountTotal / CGFloat(children.count))
      let amountStart = CGFloat(amountTotal / 2)
      
      var counter = CGFloat(0)
      for child in children {
        child.position.x = (child.parent!.position.x + CGFloat(25/2)) - amountStart
        child.position.x += amountPer * counter
        counter += 1
        if child == children[0] {}
        else {
          child.position.x -= 5
          child.position.x += CGFloat(5 * counter)
        }
        
        if child == children.last && children.count > 2 {
          for child2 in children {
            child2.position.x -= 5
          }
        }
      }
    } else {
    }
    if let scene = children.first?.scene {
      //children[0].parent!.userData?.addEntries(from: <#T##[AnyHashable : Any]#>) = scene.convertPoint(toView: children[0].frame.minX)
    }
  }
  
  static func getSuperParent(from node: SKSpriteNode) -> SKSpriteNode? {
    if let superParent = node.parent?.parent as? SKSpriteNode { return superParent }
    else { print("parent not found"); return nil }
  }
}

let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 400, height: 450)))
let scene     = SKScene(size: CGSize(width: 400, height: 450))
LOADSCENE: do {
  scene.backgroundColor = .white
  scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
  scene.physicsWorld.gravity = CGVector.zero
  sceneView.presentScene(scene)
  
  PlaygroundPage.current.liveView = sceneView
}

let prompt1 = Util.buildPrompt()
LOADPROMPT1: do {
  scene.addChild(prompt1); prompt1.position.y += 225
  prompt1.name = "First"
  
  var countar = 0; while countar != 4 { countar += 1
    prompt1.addChild(Util.buildChoice())
  }
  Util.spaceOutChildren(children: prompt1.children as! [SKSpriteNode])
  
  prompt1.children[0].addChild(Util.buildPrompt())
  
  prompt1.children[3].addChild(Util.buildPrompt())
  
  prompt1.children[0].children[0].addChild(Util.buildChoice())

  
  ADDCHOICES: do {
    
    // Our bottom right prompt:
    let brPrompt = prompt1.children[3].children[0] as! SKSpriteNode
    brPrompt.name = "BottomRight"
    
    // Add and recolor children:
    var counter = 0; while counter != 8 { counter += 1 // Because I fail at simple for loops.d
      brPrompt.addChild(Util.buildChoice())
    }
    Util.spaceOutChildren(children: brPrompt.children as! [SKSpriteNode])
    
    let children: [SKSpriteNode] = brPrompt.children as! [SKSpriteNode]
    for child in children { child.color = .blue }
    

    checkCollisions: do {
      
      guard let sp = Util.getSuperParent(from: brPrompt) else { fatalError("no super parent") }
      
      // Our newest choices farthest left position:
      let newBoxLeft = scene.convertPoint(toView: brPrompt.children.first!.frame.centerLeft)
      (brPrompt.children.first! as! SKSpriteNode).color = .black
      
      // find highest element in array
      var foundPrompt: SKSpriteNode?
      var countor = (sp.children.count - 1)
      
      while countor > 0 { countor -= 1
        let child23 = sp.children[countor]
        // We found it:
        if child23.children.count > 0 {
          foundPrompt = sp.children[countor].children.last as? SKSpriteNode
          break
        }
      }
      
      // Ensure we have a match:
      guard let prompt = foundPrompt else {
        print("no highest element found")
        break checkCollisions
      }
      
      // Determine if we are encroaching:
      guard prompt.children.count > 0 else { fatalError("no children") }
      let farRight = scene.convertPoint(toView: prompt.children.last!.frame.centerRight)
      
      /// fixme
      if farRight.x > newBoxLeft.x {
        // Move whole unit over:
        print("adjusting...\n")
        /// prompt.parent!.position.x = newBoxLeft.x
        (prompt.parent! as! SKSpriteNode).color = .gray
        prompt.parent?.position.x = brPrompt.children.first!.position.x
        
        //prompt.parent!.position.x -= 35
      }
      
      /// WTFFFFF???
      print(prompt.parent?.position.x )
      print(brPrompt.children.first!.position.x)
      //print("fr",farRight.x, "nbl",newBoxLeft.x)
      
      // Realign children from super parent:
      
      
    }
    
  }
}




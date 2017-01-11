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

func doIt() {
func getMiddleNumber(number: Int) -> Int { return ((number - 1) / 2) + 1 }
func isEven(_ amount: Int) -> Bool { if amount % 2 == 0 { return true } else { return false }}
func buildPrompt() -> SKSpriteNode {
  let ret = SKSpriteNode(color: .yellow, size: CGSize(width: 25, height: 25))
  ret.position.y -= 35
  return ret
}
func buildChoice() -> SKSpriteNode {
  let ret = SKSpriteNode(color: .green, size: CGSize(width: 25, height: 25))
  ret.position.y -= 35
  return ret
}
func addChoice(to parent: SKSpriteNode) {
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

func spaceOutChildren(children: [SKSpriteNode]) {
  
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
func getSuperParent(from node: SKSpriteNode) -> SKSpriteNode? {
  if let superParent = node.parent?.parent as? SKSpriteNode { return superParent }
  else { print("parent not found"); return nil }
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

let prompt1 = buildPrompt()
LOADPROMPT1: do {
  scene.addChild(prompt1); prompt1.position.y += 225
  prompt1.name = "First"
  
  var countar = 0; while countar != 4 {
    countar += 1
    prompt1.addChild(buildChoice())
  }
  spaceOutChildren(children: prompt1.children as! [SKSpriteNode])
  
  prompt1.children[0].addChild(buildPrompt())
  
  prompt1.children[3].addChild(buildPrompt())
  
  prompt1.children[0].children[0].addChild(buildChoice())

/**
working here::
**/
  
  let brPrompt = prompt1.children[3].children[0] as! SKSpriteNode

  var counter = 0; while counter != 8 {  // Because I fail at simple for loops.
    brPrompt.addChild(buildChoice())
    counter += 1
  }
  spaceOutChildren(children: brPrompt.children as! [SKSpriteNode])
  
  let children: [SKSpriteNode] = brPrompt.children as! [SKSpriteNode]
  for child in children {
    child.color = .blue
    
    // calculate distance before
    // draw line
    // update arrays
    // move hundreds of nodes
  
  }
  
  // Make sure no collisions:
  
  checkCollisions: do {
    let farLeft = scene.convertPoint(toView: brPrompt.frame.centerLeft)
    
    // determine if children exist:
    guard let sp = getSuperParent(from: brPrompt) else { fatalError() }
    
    var childrenWithChildren = [SKSpriteNode]()
    
    // find highest element in array
    for child2 in (sp.children as! [SKSpriteNode]) {
      if child2.children.count > 0 { childrenWithChildren.append(child2) }
    }
    
    for child3 in childrenWithChildren {
      let
      if child3.children.last!.frame.centerRight
    }
  }
  
}
}
doIt()



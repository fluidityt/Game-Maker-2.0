//: [Previous](@previous)
import SpriteKit
import PlaygroundSupport

func buildPrompt() -> SKSpriteNode {
  return SKSpriteNode(color: .yellow, size: CGSize(width: 25, height: 25))
}
func buildChoice() -> SKSpriteNode {
  return SKSpriteNode(color: .green, size: CGSize(width: 25, height: 25))
}

let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 400, height: 450)))
let scene     = SKScene(size: CGSize(width: 400, height: 450))
LOADSCENE: do {
  scene.backgroundColor = .white
  scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
  sceneView.presentScene(scene)
  PlaygroundPage.current.liveView = sceneView
}

let prompt1 = buildPrompt()
LOADPROMPT1: do {
  scene.addChild(prompt1)
}
/*
let choice1 = buildChoice()
LOADCHOICE: do {
  prompt1.addChild( choice1 )
  choice1.position.y -= 35
}

let prompt2 = buildPrompt()
BUILDPROMPT2: do {
  // prompt always build 1 choice;// choice always build 1 prompt
  choice1.addChild(prompt2)
  prompt2.position.y -= 35
}
*/




func addChoice(to parent: SKSpriteNode) {
  let new = buildChoice()
  parent.addChild(new)
  new.position -= 35
  
  var needsSpacing = false
  if parent.children.count > 1 { needsSpacing = true }
  
  if needsSpacing {
    // get maximum size of new box:
    let size = (10 * parent.children.count) + (25 * parent.children.count)
    
    
  }
  func alignToParent() {}   // Evens out choices under parent.
  func spaceOut() {}        // Moves everything over to the right.
  
}
  // func swapChoice() {}      // Dear god...


do {
  prompt1.addChild(buildChoice())
}
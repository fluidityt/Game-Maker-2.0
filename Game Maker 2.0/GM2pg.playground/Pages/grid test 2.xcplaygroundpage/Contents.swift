//: [Previous](@previous)
import SpriteKit
import PlaygroundSupport

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
  let finalWidth: CGFloat = {
    let  cWidth = CGFloat (25),
         buffer = CGFloat (10),
         count  = CGFloat (children.count),
    
         fWidth = buffer * (count - 1)
    return fWidth * (cWidth * count)
  }()

  if isEven(children.count) {
    
  } else {
    
  }
  
  
  
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
  scene.addChild(prompt1); prompt1.position.y += 225
  prompt1.addChild(buildChoice())
  prompt1.addChild(buildChoice())
}

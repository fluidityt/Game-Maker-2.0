import SpriteKit
import PlaygroundSupport

PlaygroundPage.current.liveView = Util.loadScene()

/// Member:
final class Holder: SKShapeNode {
  
  var xPos = 0, yPos = 0
  
  var Items: [SKSpriteNode] = []
  
  func initialize() {
    // Add constraints
  }
  
  func resize() {
    // move parent
    // resize parent's parent holder
  }
  
  func alignChoicesToParent() {
    // Note, if a choice has a ton of shit it should be not aligned.
    
  }
  
  func getBounds() -> [CGPoint] { return [] }
}

/// Static:
extension Holder {
  
  static var  holders: [Holder] = []
  
  static func alignHolders() {}

  static func newHolder(color: SKColor = SKColor.black) -> SKShapeNode {
   let holder = Holder(rect: CGRect(x: 0, y: 0, width: 150, height: 50), cornerRadius: 20)
  holder.strokeColor = color
    
  return holder
  }
}

final class Repeler: SKSpriteNode {
  
  func initialize(scene: SKScene) {
    isUserInteractionEnabled = true
    scene.addChild(self)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    position = touches.first!.location(in: self.scene!)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    run(.moveBy(x: -35, y: 0, duration: 0.5))
  }
}

/// Variables and shit:
let scene = Util.scene, view = Util.sceneView

/// Testing:
do { START: do {
  let repel = Repeler(color: .green, size: CGSize(width: 25, height: 25))
  
  repel.initialize(scene: scene)
  
  let block = Util.buildPrompt()
  block.position.y -= 170
  block.constraints = [SKConstraint.distance(SKRange(lowerLimit: 35), to: repel),
                       SKConstraint.positionY(SKRange(constantValue: block.position.y))]
  scene.addChild(block)
  
  let topChild  = Util.buildPrompt(); do {
    topChild.position = block.position
    topChild.position.y += 35
    topChild.constraints = [SKConstraint.distance(SKRange(constantValue: 0), to: block),
                            SKConstraint.positionY(SKRange(constantValue: topChild.position.y))]
    scene.addChild(topChild)}
  
  let top2Child = Util.buildPrompt(); do {
    top2Child.position = block.position
    top2Child.position.y += 70
    top2Child.constraints = [SKConstraint.distance(SKRange(constantValue: 0), to: block),
                             SKConstraint.positionY(SKRange(constantValue: top2Child.position.y))]
    scene.addChild(top2Child)}
  
  repel.position = block.position
  repel.position.x += 1
  }
  
  HOLDER: do {
    let holder1x1  = Holder.newHolder(color: .yellow); do {
      holder1x1.name = "1x1"
      holder1x1.position.y = (scene.frame.maxY - 50)
      holder1x1.position.x = scene.frame.midX - 35
      holder1x1.xScale = 0.5
      scene.addChild(holder1x1)
    }
    let holder2x1  = Holder.newHolder(color: .green ); do {
      holder2x1.name = "2x1"
      holder2x1.position.y = (scene.frame.maxY - 90)
      holder2x1.position.x = scene.frame.midX - 70
      scene.addChild(holder2x1)
    }
    let holder4x1  = Holder.newHolder(color: .green ); do {
    holder4x1.position.x -= 190
    holder4x1.position.y += 20
    scene.addChild(holder4x1)}
    let holder4x2  = Holder.newHolder(color: .green ); do {
      holder4x2.position.x += 35
      holder4x2.position.y += 20
      scene.addChild(holder4x2)}
    
    let nodes = scene.nodes(at: CGPoint(x: holder1x1.frame.midX, y: holder1x1.frame.minY))
    for node in nodes { print(node.name, "\n") }
    
    // On adding new node, extend holder, then check if holder overlaps anything.
    
  }
}
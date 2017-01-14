import SpriteKit
import PlaygroundSupport
  PlaygroundPage.current.liveView = Util.loadScene()
  let scene = Util.scene, view = Util.sceneView

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

do {
  START: do {
  let repel = Repeler(color: .green, size: CGSize(width: 25, height: 25))
  
  repel.initialize(scene: scene)
  
  let block = Util.buildPrompt()
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
}

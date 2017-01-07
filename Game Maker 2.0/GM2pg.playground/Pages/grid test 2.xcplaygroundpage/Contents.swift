//: [Previous](@previous)
import SpriteKit
import PlaygroundSupport

let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 400, height: 300)))
let scene     = SKScene(size: CGSize(width: 400, height: 300))
loadScene: do {
  scene.backgroundColor = .white
  scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
  sceneView.presentScene(scene)
  PlaygroundPage.current.liveView = sceneView
}

let box = [SKSpriteNode(color: .yellow, size: CGSize(width: 25, height: 25))]
loadBox: do {
  scene.addChild(box[0])
}



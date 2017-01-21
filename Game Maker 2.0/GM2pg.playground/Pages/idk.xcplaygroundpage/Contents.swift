import SpriteKit
import PlaygroundSupport


final class Tester: SKScene {
 
  let top = Util.buildPrompt(),
      topChildren = [Util.buildChoice(), Util.buildChoice()],
  
      second = [Util.buildPrompt(), Util.buildPrompt()],
      secondChildren = [[Util.buildChoice(),Util.buildChoice()],
                        [Util.buildChoice()]],
  
      refPoint = SKNode()
  
  override func didMove(to view: SKView) {
    /// Ref:
    anchorPoint = CGPoint(x: 0, y: 1)
    addChild(refPoint)
    refPoint.position = frame.topLeft
    
    /// Top:
    addChild(top)
    top.position = CGPoint(x: frame.midX, y: frame.midY)
    
    /// TopC:
    for child in topChildren { top.addChild(child) }
    //Util.spaceOutChildren(children: (top.children as! [SKSpriteNode]))
  
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
    //for child in second { Util.spaceOutChildren(children: child.children as! [SKSpriteNode]) }
  
    
  }
  
  private func algo() {
  
    var isOverlapped = true
    
    /// Recursive:
    func checkIt(node: SKNode) {
      
      if isOverlapped { checkIt(node: node) }
      
    }
  
  }
  
  private func zoom(point: CGPoint) {
    
  }
  
  /// algo()
  /// take this to SO
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    let node = second[0]
    
    let touch = touches.first
    
    let positionInScene = touch!.location(in: self)
    print( touch!.location(in: self) )
    
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


PlaygroundPage.current.liveView = Util.loadScene(Tester(size: CGSize(width: 320, height: 320)))


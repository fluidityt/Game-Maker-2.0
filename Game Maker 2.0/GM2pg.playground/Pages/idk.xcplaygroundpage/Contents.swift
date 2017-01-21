import SpriteKit
import PlaygroundSupport


final class Tester: SKScene {
 
  let top = Util.buildPrompt(),
      topChildren = [Util.buildChoice(), Util.buildChoice()],
  
      second = [Util.buildPrompt(), Util.buildPrompt()],
      secondChildren = [[Util.buildChoice(),Util.buildChoice()],
                        [Util.buildChoice()]]
  
  override func didMove(to view: SKView) {
    /// Top:
    addChild(top)
    
    /// TopC:
    for child in topChildren { top.addChild(child) }
    Util.spaceOutChildren(children: (top.children as! [SKSpriteNode]))
  
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
    for child in second { Util.spaceOutChildren(children: child.children as! [SKSpriteNode]) }
  
    
  }
  
  private func algo() {
  
    var isOverlapped = true
    
    /// Recursive:
    func checkIt(node: SKNode) {
      
      if isOverlapped { checkIt(node: node) }
      
    }
  
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    /// algo()
    /// take this to SO
    let node = atPoint(touches.first!.location(in: self))
    print(node)
    print(nodes(at: convert(node.position, to: self)))
    
  }
}


PlaygroundPage.current.liveView = Util.loadScene(Tester(size: CGSize(width: 320, height: 320)))


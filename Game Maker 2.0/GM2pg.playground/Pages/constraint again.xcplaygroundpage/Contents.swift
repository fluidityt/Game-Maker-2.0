import SpriteKit

fileprivate var holders: [[Holder]]

/// Classes:
class InGameElement {
  final var title = String()
  final var node = SKNode()
}

final class Prompt: InGameElement {
  
}

final class Choice: InGameElement {
  
}

/// Util funcs:
func addPrompt() {}
func addPromptHolder(toChoice choice: Choice) {
  addPrompt()
}

func addChoice(){}
func addChoiceHolder(toPrompt prompt: Prompt) {
  addChoice()
}

/// Holders:
class Holder {

 final var node = SKShapeNode()
  
 final var children = [SKNode()]
  
 final func resize() {
    
    func calculateSize() -> CGFloat {
      
      let oldLength = node.frame.width
      let buffer = CGFloat(10)
      
      var newLength = buffer
      
      for child in children {
        newLength += child.frame.width
        newLength += buffer
      }
      
      return (newLength / oldLength)
    }
    
    node.xScale = calculateSize()
    /// Node spacing:
    /// ...
  }
  
}

final class PromptHolder: Holder {
 
    var prompt: Prompt?
}

final class ChoiceHolder: Holder {
  var choice: Choice?
  
}

/// Testing: 
didMoveToView: do {
  setup: do {
    print("hii")
    holders = [[Holder()]]
    holders[0] = [Holder()]
    for _ in 2...10 {
      holders.append([Holder()])
    }
  };
  
  
}



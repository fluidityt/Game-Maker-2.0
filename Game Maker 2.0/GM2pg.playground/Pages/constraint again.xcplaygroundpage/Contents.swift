import SpriteKit

/// Classes:
class Prompt {
  
}

class Choice {
  
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

  var node = SKShapeNode()
  
  var children = [SKNode()]
  
  func resize() {
    
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

class PromptHolder: Holder {
 
    var prompt: Prompt?
}

class ChoiceHolder: Holder {
  var choice: Choice?
  
}

/// Testing: 
do {
    var x = 120.0
  var y = 100.0
  print(x/y)
}



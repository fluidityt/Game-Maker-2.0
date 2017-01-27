import SpriteKit

/// Classes:
class InGameElement {
  final var title = String()
  final var node = SKNode()
};

final class Prompt: InGameElement {
  
};

final class Choice: InGameElement {
  
};

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
  
};

final class PromptHolder: Holder {
 
    var prompt: Prompt?
};

final class ChoiceHolder: Holder {
  var choice: Choice?
  
};

/// System stuff:
enum Sys {                                            private init() { self = Sys() }
  
  static var holders = [[Holder()]]
  
  static func addPrompt() {
  }
  static func addPromptHolder(toChoice choice: Choice) {
    addPrompt()
  }
  
  static func addChoice(){
  }
  static func addChoiceHolder(toPrompt prompt: Prompt) {
    addChoice()
  }
  
  static func ineet() {
    print("System initiate...")
    holders[0] = [Holder()]
    for _ in 2...10 { holders.append([Holder()]) }
  }
  
  static func status() {
    print("system has", holders.count, "maximum columns")
    for i in 0...(holders.count - 1) {
      print("column", i, "has", holders[i].count, "holders")
    }

  }
  
};

/// Testing:
didMoveToView: do {
  Sys.ineet()
  Sys.status()
}



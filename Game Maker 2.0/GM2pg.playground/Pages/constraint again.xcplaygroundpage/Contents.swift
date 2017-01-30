import SpriteKit
func newLine() { print("\n") }

/// Classes:
class InGameElement {
  final var title = String()
  final var node = SKNode()
  
  init(title: String) { self.title = title }
};

/// Shouldn't these be holders?
final class Prompt: InGameElement {
  var subsequentChoiceHolder = ChoiceHolder()
};

final class Choice: InGameElement {
  var subsequentPrompt = Prompt(title: "default prompt")
};

/// Holders this needs work...:
class Holder {
  
  final var node = SKShapeNode()
  
  /// What was this for again????:
  //final var children = [SKNode()]
  
  /// Fuck...
  /*final func resize() {
    
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
  }*/
  
};

final class PromptHolder: Holder {
  var prompt = Prompt(title: "default prompt")
};

final class ChoiceHolder: Holder {
  var choices = [Choice]()
};

/// System stuff:
enum Sys {                                            private init() { self = Sys() }
  
  static var holders = [[Holder()]]
  
  static var selected = InGameElement(title: "default")

  /////
  
  static func addSuperPromptHolder(superPrompt: Prompt) {
    
  }
  
  static func addPromptHolder(toChoice choice: Choice) {
    //addPrompt()
  }
  
  static func addChoiceHolder(toPrompt prompt: Prompt) {
    //addChoice()
  }
  
  /////
  
  static func addPrompt(_ prompt: Prompt) {
    
    print("adding prompt..")
    if selected is Choice {
        let sel = selected as! Choice
        sel.subsequentPrompt = prompt
    } else { print("--can't add prompt") }
    newLine()
  }
  
  static func addChoice(_ choice: Choice){
    print("adding choice..")
    if selected is Prompt {
      let sel = selected as! Prompt
      sel.subsequentChoiceHolder.choices.append(choice)
    } else { print("can't add choice") }
    newLine()
  }

  static func ineet() {
    print("System initiate...")
    holders[0] = [Holder()]
    for _ in 2...10 { holders.append([Holder()]) }
  }
  
  static func status() {
    print("system has", holders.count, "maximum columns")
    for i in 0...(holders.count - 1) {
      
      switch holders[i][0] {
        case is PromptHolder, is ChoiceHolder:
          print("column", i, "has", holders[i].count, "holders")
        default:
          print("column", i, "has 0 real holders")
      }
    }
    newLine()
  }
  
};

/// Testing:
didMoveToView: do {
  Sys.ineet()
  
  /// Set up stuff:
  let superPrompt = Prompt(title: "Super")
  //Sys.addPrompt()
  /**
   part 1:
   - make super holder
   - make super prompt
   - make choice holder
   - add choice holder to super prompt
   - place super prompt in super holder
   
   part 2:
   - select super prompt
   - action: make new, default choice
   - make new prompt holder
   - add prompt holder to choice
   - add default choice to super prompt's choice holder
   
   part 3:
   - select default choice
   - action: make new, default prompt
   - make new choice holder
   - add choice holder to new prompt
   - add new prompt to choice's prompt holder
   
 */
  
}



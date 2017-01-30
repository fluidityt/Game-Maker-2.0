import SpriteKit
func newLine() { print("\n") }

/// Classes:
class InGameElement {
  final var title = String()
  final var node = SKNode()
  
  init(title: String) { self.title = title }
};

final class Prompt: InGameElement {
  var subsequentChoiceHolder = ChoiceHolder()
};

/// FIXME: SHould be a holder member..
final class Choice: InGameElement {
  var subsequentPrompt = Prompt(title: "default prompt")
};

/// FIXME: Holders this needs work...:
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
  var prompts = [Prompt]()
};

final class ChoiceHolder: Holder {
  var choices = [Choice]()
};

/// System stuff:
enum Sys {                                            private init() { self = Sys() }
  
  static var holders = [[Holder()]]
  
  static var selected = InGameElement(title: "default")
  
  static func addPrompt(_ prompt: Prompt) {
    
    print("adding prompt..")
    if selected is Choice {
        let sel = selected as! Choice
        sel.subsequentPrompt = prompt
    } else { print("--can't add prompt") }
    newLine()
    
      static func addChoiceHolder(toPrompt prompt: Prompt) {
    //addChoice()
  }
  }
  
  static func addChoice(_ choice: Choice){
    print("adding choice..")
    if selected is Prompt {
      let sel = selected as! Prompt
      sel.subsequentChoiceHolder.choices.append(choice)
    } else { print("can't add choice") }
    newLine()
    
    static func addPromptHolder(toChoice choice: Choice) {
    //addPrompt()
  }
  }

  static func ineet() {
    print("System initiate...")
    holders[0] = [Holder()]
    for _ in 2...10 { holders.append([Holder()]) }
    
    /// Make first stuff:
    let superHolder = PromptHolder()
    let superPrompt = Prompt(title: "super P")
    let choiceHolder = ChoiceHolder()
    
    superPrompt.subsequentChoiceHolder = choiceHolder
    superHolder.prompt.append(superPrompt)
    selected = superPrompt
  
    /** How do I register this? OH right, a search algo =/ or threaded while..
        solutions:
         - thread an updater that goes through and assigns a grid location
         - check relative Y positions (no way X could work)
         - check for number of parents (thus giving you row #)
         - if you know the position of one thing, then the immediate things around
           it you should know too.. such as if you add a new thing to that known
           thing or, if you delete from that known thing--you will know where you are.
     */
 
  }
  
  static func status() {
    print("selected is", selected.title)
    print("system has", holders.count, "maximum columns")
    for i in 0...(holders.count - 1) {
      
      switch holders[i][0] {
        case is PromptHolder, is ChoiceHolder:
          print("column", i, "has", holders[i].count, "holders")
        default: ()
        
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
   - register in .holders
   
   part 2:
   - select super prompt
   - action: make new, default choice
   - make new prompt holder
   - add prompt holder to choice
   - add default choice to super prompt's choice holder
   - register in .holders
   
   part 3:
   - select default choice
   - action: make new, default prompt
   - make new choice holder
   - add choice holder to new prompt
   - add new prompt to choice's prompt holder
   - register in .holders
 */
  
}



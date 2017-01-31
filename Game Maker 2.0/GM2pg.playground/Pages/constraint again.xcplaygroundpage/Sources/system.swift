import Foundation

enum Sys {
  
  static var holders = [[Holder()]]
  
  static var selected = InGameElement(coder: NSCoder())
  
  static var selectedsRow = 0
  
  /// Does stuff based on Sys.selection
  enum Btn {
    
    static func addPrompt(_ prompt: Prompt) {
      print("adding prompt..")
      
      guard let sel = (selected as? Choice) else {
        print("--can't add prompt: sel isn't Choice")
        return
      }
      guard let holder = sel.children.first else {              // Check if has child.
        /// Create a holder:
        return
      }
      guard let promptHolder = (holder as? PromptHolder) else { // Check if child is PH.
        fatalError("has child but not a PH")
      }
      
      promptHolder.prompts.append(prompt)
      newLine()
    }
    
    static func addChoice(_ choice: Choice){
      print("adding choice..")
      if selected is Prompt {
        let sel = selected as! Prompt
        //  sel.subsequentChoiceHolder.choices.append(choice)
      } else { print("can't add choice") }
      newLine()
    }
  };
  
  enum Utl {
    static func util_addChoiceHolder(toPrompt prompt: Prompt) {
      
    }
    
    static func util_addPromptHolder(toChoice choice: Choice) {
      
    }
  };
  
  static func ineet() {
    print("System initiate...")
    holders[0] = [Holder()]
    for _ in 2...10 { holders.append([Holder()]) }
    
    /// Make first stuff:
    let
    superHolder = PromptHolder(),
    superPrompt = Prompt(title: "super P"),
    choiceHolder = ChoiceHolder()
    
    superPrompt.addChild(choiceHolder)
    superHolder.prompts.append(superPrompt)
    
    holders[0][0] = superHolder
    holders[1][0] = choiceHolder
    
    selected = superPrompt
    selectedsRow = 0
    
    /// holder work vs IGE work... 
    /// Holders are for drawing, IGE is for game engine logic
    /// Each mod must alterar both...
    
    
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


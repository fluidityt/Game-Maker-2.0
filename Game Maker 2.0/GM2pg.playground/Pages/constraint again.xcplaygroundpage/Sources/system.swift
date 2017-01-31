import SpriteKit

enum Sys {
  
  private static var
  holders = [[Holder()]],
  selected = InGameElement(title: "", color: .black, size: CGSize.zero),
  selectedsRow = 0  // This will be a chore to update...
  
  /** Button: Does stuff based on Sys.selection.*/
  private enum Btn {
    
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
      
      guard let sel = (selected as? Prompt) else {
        print("--can't add prompt: sel isn't Prompt")
        return
      }
      guard let holder = sel.children.first else {              // Check if has child.
        /// Create a holder:
        return
      }
      guard let choiceHolder = (holder as? ChoiceHolder) else { // Check if child is CH.
        fatalError("has child but not a CH")
      }
      
      choiceHolder.choices.append(choice)
      newLine()    }
  };
  
  /** Utility: Does stuff in general.*/
  private enum Utl {
    
    static func findRow(ofIGE startingIGE: InGameElement) -> Int {  // Enumerate based on parents... with superPrompt being row 0 */
      
      var currentIGE = startingIGE
      var counter = -1
      
      print("Finding row for \(startingIGE.title)")
      while counter != 1000 {                                       // 1000 is just a prevention for perma-run
        counter += 1
        
        guard let igeHolder = currentIGE.parent else { fatalError("ige has no holder") }
        
        guard let foundParent = igeHolder.parent else {             // We found no parent.. SP?
          assert(currentIGE.title == Prompt.superPromptTitle,
                 "super parent was NOT super prompt..")
    
          // We found our super prompt... counter should be == our row#.. exit loop:
          print("SuperPrompt found. Row # is \(counter)")
          newLine()
          return counter
        }
        
        if let foundIGE = foundParent as? InGameElement {
          currentIGE = foundIGE                                     // Restart loop!
        } else { fatalError("found parent was not an IGE") }
      }
      
      fatalError("loop exited and wasn't supposed to.")
    }
    
    static func findRowTest() {
      /// do this first
      
    }
    static func addChoiceHolder(toPrompt prompt: Prompt) {
      
    }
    
    static func addPromptHolder(toChoice choice: Choice) {
      
    }
  };
  
  static func ineet() {
    print("System initiate...")
    holders[0] = [Holder()]
    for _ in 2...10 { holders.append([Holder()]) }
    
    /// Make first stuff:
    let
    superHolder = PromptHolder(),
    superPrompt = Prompt(title: "super P")
    
    superHolder.prompts.append(superPrompt)
    
    holders[0][0] = superHolder
    
    selected = superPrompt
    selectedsRow = 0
    
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


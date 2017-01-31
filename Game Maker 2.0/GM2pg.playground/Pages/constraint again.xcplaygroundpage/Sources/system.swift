import Foundation

enum Sys {
  
  static var holders = [[Holder()]]
  
  static var selected = InGameElement(title: "default")
  
  static func addPrompt(_ prompt: Prompt) {
    
    print("adding prompt..")
    if selected is Choice {
      let sel = selected as! Choice
      sel.subsequentPrompt = prompt
    } else { print("--can't add prompt") }
    newLine()
  }
  static func addChoiceHolder(toPrompt prompt: Prompt) {
    //addChoice()
  }
  
  
  static func addChoice(_ choice: Choice){
    print("adding choice..")
    if selected is Prompt {
      let sel = selected as! Prompt
      sel.subsequentChoiceHolder.choices.append(choice)
    } else { print("can't add choice") }
    newLine()
  }
  
  static func addPromptHolder(toChoice choice: Choice) {
    //addPrompt()
  }
  
  
  static func ineet() {
    print("System initiate...")
    holders[0] = [Holder()]
    for _ in 2...10 { holders.append([Holder()]) }
    
    /// Make first stuff:
    let superHolder = PromptHolder(),
    superPrompt = Prompt(title: "super P"),
    choiceHolder = ChoiceHolder()
    
    superPrompt.subsequentChoiceHolder = choiceHolder
    superHolder.prompts.append(superPrompt)
    selected = superPrompt
    
    /** How do I register this? OH right, a search algo =/ or threaded while..
     solutions:
     - thread an updater that goes through and assigns a grid location
     - check relative Y positions (no way X could work)
     - check for number of parents (thus giving you row #)
     - if you know the position of one thing, then the immediate things around
     it you should know too.. such as if you add a new thing to that known
     thing or, if you delete from that known thing--you will know where you are.
     - cache nearby shit (scenes?)
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


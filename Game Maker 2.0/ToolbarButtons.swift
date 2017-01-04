//
//  ToolbarButtons.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.

import SpriteKit


// MARK: - TOOLBARBUTTON.SWIFT

// FIXME: Needs testing:
fileprivate func failedErrorCheck(_ riskyPrompt: Prompt? = ux.currentPrompt) -> Bool {
  guard let prompt = riskyPrompt else { print("found nil"); return true }
  if prompt.isInitialized == false    { print("not init" ); return true }
  else                                { print("good 2 go"); return false}
}


// NOTE: Subclasses' respective same-named function will run on overriden touchesBegan().
final class ToolbarButtons {
  
  typealias DidSucceed = Bool
 
  // Add option to current prompt:
  final class AddChoice: SKSpriteNode {
    
    // FIXME: Needs testing:
    func addChoice(to prompt: Prompt) -> DidSucceed {
      
      guard let choiceCount = prompt.choices?.count else {
        prompt.addChoice()
        return true
      }
      
      if choiceCount < prompt.config_maxChoices {
        prompt.addChoice()
        return true
      }
      
      else {
        print("can't add any more choices to \(prompt.name)")
        return false
      }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      var result = false
      defer { result ? print("successfully added choice") : print("did not add choice!") }
      if failedErrorCheck() { return }
      result = addChoice(to: ux.currentPrompt!)
    }
  }
}

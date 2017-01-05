//
//  Prompt.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.

import SpriteKit

// MARK: - PROMPT.SWIFT
final class Choice: SKSpriteNode, p_NeedsInitialization {
  //  let config_size = CGSize(width: 100, height: 50)
  var isInitialized: Bool = false

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    ux.currentChoice = self
  }
}
// The visible node that will export to swift code:
final class Prompt: SKSpriteNode, p_NeedsInitialization {
  
  
  // Because we need some sort of global config for this and I'm too lazy presently:
  let config_maxChoices: Int = 2
  
  // Will be modified from Toolbar.buttons[addChoiceButton] .addChoice() / .removeChoice()
  var parentChoice: Choice?     // The one that leads to this prompt.
  var choices: [Choice]?        // The list of choices of this prompt.
  
  // INITIALIZE STUFF:
  var isInitialized: Bool = false
  
  func initialize(name: String) {
    self.name = name
    isUserInteractionEnabled = true
    isInitialized = true
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("hi")
    ux.currentPrompt = self
    ux.highlight(self)
  }
  
}



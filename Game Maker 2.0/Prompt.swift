//
//  Prompt.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.

import SpriteKit

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
    zPosition = 1     // FIXME: << WTF DOES THIS DO IT??
    isInitialized = true
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    ux.currentPrompt = self
    ux.highlight(self)
  }
  
}



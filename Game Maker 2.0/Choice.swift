//
//  File.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/6/17.

import SpriteKit

// MARK: - PROMPT.SWIFT
final class Choice: SKSpriteNode, p_NeedsInitialization {
  //  let config_size = CGSize(width: 100, height: 50)
  var isInitialized: Bool = false
  
  func initialize() {
    isUserInteractionEnabled = true
    //zPosition = 1
    isInitialized = true
  }
  
  // TOUCHES:
  func touchOverview() {
    ux.currentChoice = self
    if let parentPrompt = parent { ux.currentPrompt = (parentPrompt as! Prompt) }
    else { fatalError("choice: no parent found for choice") }
    ux.highlight(self)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let state = ux.currentState else { fatalError("choice: how did we get nil?") }
    
    switch state {
      case .overview: touchOverview()
      // FIXME: Implement other states
      default: fatalError("cases not yet implemented")
    }
  }
}

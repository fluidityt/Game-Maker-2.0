//
//  Toolbar.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.
//  Copyright © 2017 Dude Guy . All rights reserved.
//

// FIXME: Should we mandate initialization?

import SpriteKit

protocol p_NeedsInitialization {
  var isInitialized: Bool { get set }
}

// The visible node that will export to swift code:
final class Prompt: SKSpriteNode, p_NeedsInitialization {
  
  // Because we need some sort of global config for this and I'm too lazy presently:
  let config_maxChoices: Int = 2
  
  // Will be modified from Toolbar.buttons[addChoiceButton] .addChoice() / .removeChoice()
  var currentNumChoices: Int = 0
  
  
  // INITIALIZE STUFF:
  var isInitialized: Bool = false
  
  func initialize(name: String) {
    self.name = name
    isInitialized = true
  }
}


// MARK: - TOOLBARBUTTON.SWIFT

fileprivate func failedInitializeCheck(_ prompt: Prompt) -> Bool {
  guard prompt.isInitialized else {
    print("prompt isn't initialized")
    return true
  }
  return false
}


final class ToolbarButtons {
  
  typealias DidSucceed = Bool
  
  final class AddChoice: SKSpriteNode {
    // add option to current prompt.
    
    func addChoice(to prompt: Prompt) -> DidSucceed {

      if failedInitializeCheck(prompt) { return false }
      
      if (prompt.currentNumChoices < prompt.config_maxChoices) {
        prompt.currentNumChoices += 1
        // TODO: Do other gui stuff here later on
        return true
      }
      
      else {
        print("can't add any more choices to \(prompt.name)")
        return false
      }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
  }
}


// MARK: - TOOLBAR.SWIFT

final class Toolbar: SKSpriteNode {

  // We need to keep track of UI visibility:
  private enum State { case open, closed, hidden }
  private var state: State = .open
  
  // We need to be able to display buttons in correct order and position:
  enum ButtonNames { case addChoiceButton }
  var buttons: [ButtonNames: SKSpriteNode] = [:]
  
  // Because too lazy to override inits and stuff:
  func initialize(scene: SKScene) {
    
    // Prevent crashes:
    if self.scene != nil { scene.addChild(self) }
    
    // plist = loadPlist()
    // Load plist data for open or closed:
    // state = plist.state
    
  }
  
  
}

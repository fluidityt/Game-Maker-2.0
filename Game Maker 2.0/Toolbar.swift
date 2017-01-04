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

fileprivate var currentPrompt: Prompt?

fileprivate func failedErrorCheck(_ riskyPrompt: Prompt? = currentPrompt) -> Bool {
  guard let prompt = riskyPrompt else { print("found nil"); return true }
  if prompt.isInitialized == false    { print("not init" ); return true }
  else                                { print("good 2 go"); return false}
}

final class ToolbarButtons {
  
  // Because we need more clarity:
  typealias DidSucceed = Bool
  
  final class AddChoice: SKSpriteNode {
    // add option to current prompt.
    
    // FIXME: Needs testing:
    func addChoice(to prompt: Prompt) -> DidSucceed {
      
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
      
      // Mutable for convenience:
      var result = false
      
      defer { // Shows regardless of result of error check
        result ? print("successfully added choice") : print("did not add choice!")
      }
      
      // Determines whether we run .addChoice or not:
      if failedErrorCheck() { return }
      
      // Possibly update our result from the default 'false' which will be called in defer:
      result = addChoice(to: currentPrompt!)
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

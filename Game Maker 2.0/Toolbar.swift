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

// Because we need a global state namespace:
enum ux {
  static var currentPrompt: Prompt?,
             currentScene:  GameScene?,
          // currentSelection: Something?
             isInitialized: Bool = false
  
  static func initialize(scene: GameScene) {
    currentScene = scene
    isInitialized = true
  }
}

// MARK: - PROMPT.SWIFT

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
      var result = false
      defer { result ? print("successfully added choice") : print("did not add choice!") }
      if failedErrorCheck() { return }
      result = addChoice(to: ux.currentPrompt!)
    }
  }
}


// MARK: - TOOLBAR.SWIFT

final class Toolbar: SKSpriteNode, p_NeedsInitialization {
  
  // We need to keep track of UI visibility:
  enum State { case open, closed, hidden }
  var state: State = .open
  
  // We need to be able to display buttons in correct order and position:
  enum ButtonNames { case addChoiceButton }
  var buttons: [ButtonNames: SKSpriteNode] = [:]
  
  // Because too lazy to override inits and stuff:
  var isInitialized: Bool = false
  func initialize(scene: SKScene) {
    // Prevent crashes:
    if ux.isInitialized == false { fatalError("not init") }
    let curScene = ux.currentScene!
    
    size = curScene.size
    curScene.addChild(self)
    // plist = loadPlist()
    // Load plist data for open or closed:
    // state = plist.state
    isInitialized = true
  }
  
  
}

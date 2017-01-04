//
//  enum ux.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.

import SpriteKit

// FIXME: Add a text support init for SKSpriteNode
protocol p_NeedsInitialization {
  var isInitialized: Bool { get set }
}

// Because we need a global state namespace:
enum ux {
  static var currentPrompt: Prompt?,
             currentScene:  GameScene?,
             currentChoice: Choice?,
          // currentSelection: Something?
             isInitialized: Bool = false
  
  static func initialize(scene: GameScene) {
    currentScene = scene
    
    currentPrompt = Prompt(color: .white, size: CGSize(width: 300, height: 300))
    currentPrompt!.initialize(name: "Default Prompt")
    
    isInitialized = true
  }
}


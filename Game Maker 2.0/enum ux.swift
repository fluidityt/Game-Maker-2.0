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
             highlightNode: SKShapeNode?,
             toolbar:       Toolbar?,
             isInitialized: Bool = false
  
  static func unselect() {
    currentPrompt = nil
    currentChoice = nil
    highlightNode!.removeFromParent()
  }
  
  static func highlight(_ node: SKSpriteNode) {
    
    print("hiliting b4 guard")
    guard isInitialized else { print("ux: not init"); return }
    
    if highlightNode!.parent != nil { highlightNode!.removeFromParent() }
    highlightNode = SKShapeNode(rectOf: node.frame.size)
    highlightNode!.lineWidth = 5
    highlightNode!.strokeColor = .blue
    node.addChild(highlightNode!)
  }
  
  static func initialize(scene: GameScene) {

    // FIXME: Initial prompt:
    let highlightN = SKShapeNode(rectOf: scene.frame.size)
    scene.addChild(highlightN)
    highlightNode = highlightN

    let prompt = Prompt(color: .white, size: CGSize(width: 300, height: 300))
    prompt.initialize(name: "Default Prompt")
    scene.addChild(prompt)
    currentPrompt = prompt

    currentScene  = scene
    
    isInitialized = true
    highlight(prompt)

    // FIXME: Make more isInitialized types
    let toolbar = Toolbar(color: .green, size: CGSize(width: 145, height: 500))
    toolbar.initialize(scene: scene)
    
  }
  
}


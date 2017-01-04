//
//  Toolbar.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.

// FIXME: Should we mandate initialization?

import SpriteKit

// MARK: - TOOLBAR.SWIFT

final class Toolbar: SKSpriteNode, p_NeedsInitialization {
  
  // Because we need a global config and lazy:
  let config_buttonSize = CGSize(width: 100, height: 100)
  
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
    curScene.addChild(self)
    
    selfConfig: do {
      position.y = curScene.frame.midY
      position.x = curScene.frame.maxX
      position.x -= (frame.size.width / 2)
      
      isUserInteractionEnabled = true
      
      // plist = loadPlist()
      // Load plist data for open or closed:
      // state = plist.state
    }

    buttonSetup: do {
      ACB: do {
        let acb = ToolbarButtons.AddChoice(color: .blue, size: config_buttonSize)
        acb.position = CGPoint(x: 0, y: 0)
        acb.isUserInteractionEnabled = true
        addChild(acb)
        buttons[.addChoiceButton] = acb
      }
    }
        isInitialized = true
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    // FIXME: Do proper math for the vectors...
    let config_duration = 0.175
    
    switch state {
      case .open:
        run(.move(by: CGVector(dx:  125, dy: 0), duration: config_duration))
        state = .closed
      case .closed:
        run(.move(by: CGVector(dx: -125, dy: 0), duration: config_duration))
        state = .open
      default: ()
    }
  }
  
  
}

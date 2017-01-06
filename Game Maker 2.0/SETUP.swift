//
//  PROTOCOLS.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/6/17.
//  Copyright © 2017 Dude Guy . All rights reserved.
//

import SpriteKit

// GLOBALS:
enum g {
  static var view: SKView?,
             scene: GameScene?
}

protocol p_NeedsInitialization {
  var isInitialized: Bool { get set }
}

protocol p_NeedsStaticInitialization {
  static var isInitialized: Bool { get set }
}

protocol p_HasState {
  func touchDetail()
  func touchOverview()
  func touchMulti()
  func touchAdvance()
}

// TODO: Should I put this in the ux place?
enum UXState {
    case detail,    // Brings up detail screen.
         overview,  // Drag n drop, etc.
         multi,     // Multiple-select.
         advance    // Cinema-style.
}

//
//  PROTOCOLS.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/6/17.
//  Copyright © 2017 Dude Guy . All rights reserved.
//

import SpriteKit

// GLOBALS
var gView: SKView?
var gScene: GameScene?


// FIXME: Add a text support init for SKSpriteNode
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

enum UXState {
    case detail,    // Brings up detail screen.
         overview,  // Drag n drop, etc.
         multi,     // Multiple-select.
         advance    // Cinema-style.
}

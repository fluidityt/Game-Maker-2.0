//
//  GameScene.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.
//  Copyright © 2017 Dude Guy . All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

  override func didMove(to view: SKView) {
    ux.initialize(scene: self)
    let toolbar = Toolbar(color: .green, size: CGSize(width: 145, height: 500))
    toolbar.initialize(scene: self)
  }
  
}

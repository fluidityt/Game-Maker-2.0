//
//  GameScene.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.
//  Copyright © 2017 Dude Guy . All rights reserved.
//

import SpriteKit

var gView: SKView?

class GameScene: SKScene {

  override func didMove(to view: SKView) {
    gView = view
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    ux.initialize(scene: self)
    let toolbar = Toolbar(color: .green, size: CGSize(width: 145, height: 500))
    toolbar.initialize(scene: self)
  }
  
}

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
    g.view = view
    g.scene = self
    
    view.layer.cornerRadius = view.frame.size.width/2
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    ux.initialize(scene: self)
    
    drawLine(from: ux.toolbar!.frame.topLeft, to: ux.currentPrompt!.frame.bottomRight)
  }
  

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      ux.unselect()
  }
  
}


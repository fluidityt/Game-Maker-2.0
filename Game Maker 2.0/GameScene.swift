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
    view.layer.cornerRadius = view.frame.size.width/2
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    ux.initialize(scene: self)
    
    let primp = Prompt(color: .gray, size: CGSize(width: 200, height: 200))
    addChild(primp)
    primp.isUserInteractionEnabled = true
    primp.position.y += 200
  }
  
  //override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
  //}
  
}


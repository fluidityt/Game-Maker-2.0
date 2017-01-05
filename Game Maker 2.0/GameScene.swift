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
    let toolbar = Toolbar(color: .green, size: CGSize(width: 145, height: 500))
    toolbar.initialize(scene: self)
  }
  
  func panned(sender: UIPanGestureRecognizer){
    if sender.state == UIGestureRecognizerState.began{

    }
    
    if sender.state == UIGestureRecognizerState.changed{
      
      var translation = sender.translation(in: sender.view)
      translation = CGPoint(x:-translation.x, y: translation.y);
      
      //backgroundColor.position = CGPoint(x: backgroundColor.position.x - translation.x,
      //                                 y: background.position.y - translation.y)
      
      
      sender.setTranslation(CGPoint.zero, in: sender.view)
      
    }
    
    if sender.state == UIGestureRecognizerState.ended{
      
    }
  }
  
}


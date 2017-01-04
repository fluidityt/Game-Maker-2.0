//
//  func labelToTex.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.

import SpriteKit

func textToTexture(text: String,
                   color: SKColor = SKColor.black,
                   bordered: Bool = true) -> SKTexture {
  
  let returnNode = SKNode()
  
  let tempLabel = SKLabelNode(text: text)
  tempLabel.fontColor = color
  tempLabel.verticalAlignmentMode = .center
  
  let tempBox   = SKShapeNode(rectOf: tempLabel.frame.size)
  tempBox.strokeColor = .blue
  
  tempBox.addChild(tempLabel)
  
  return gView!.texture(from: tempBox)!
  //  return gView!.texture(from: tempLabel)!
}

//
//  func labelToTex.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.

import SpriteKit

func textToTexture(text: String,
                   color: SKColor = SKColor.black,
                   bordered: Bool = true,
                   borderColor: SKColor = SKColor.yellow) -> SKTexture {
  
  
  let returnNode = SKNode()
  
  let tempLabel = SKLabelNode(text: text)
  tempLabel.fontColor = color
  tempLabel.verticalAlignmentMode = .center
  
  if bordered {
    let tempBox = SKShapeNode(rectOf: tempLabel.frame.size)
    tempBox.strokeColor = borderColor
  
    tempLabel.setScale(0.9) // To make it fit inside borcer.
    
    tempBox.addChild(tempLabel)
    returnNode.addChild(tempBox)
  } else { returnNode.addChild(tempLabel) }
  
  return gView!.texture(from: returnNode)!
  //  return gView!.texture(from: tempLabel)!
}

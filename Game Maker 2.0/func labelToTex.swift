//
//  func labelToTex.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.

import SpriteKit

func labelToTex(text: String, color: SKColor) -> SKTexture {
  let tempLabel = SKLabelNode(text: text)
  tempLabel.fontColor = color
  return gView!.texture(from: tempLabel)!
}

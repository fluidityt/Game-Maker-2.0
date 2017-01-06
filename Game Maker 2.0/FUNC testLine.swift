//
//  FUNC testLine.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/6/17.
//  Copyright © 2017 Dude Guy . All rights reserved.
//

import SpriteKit

func drawLine(from point1: CGPoint, to point2: CGPoint) {
  let linePath = CGMutablePath()
  linePath.move(to: point1)
  linePath.addLine(to: point2)

  let newLine = SKShapeNode(path: linePath)
  newLine.strokeColor = .brown
  newLine.lineWidth = 3
  newLine.zPosition = 10
  
  g.scene?.addChild(newLine)
}

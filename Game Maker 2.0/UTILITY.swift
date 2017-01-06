//
//  UTILITY.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/5/17.
//  Copyright © 2017 Dude Guy . All rights reserved.
//

import Foundation
import  SpriteKit

//
// TODO: Add a text support init for SKSpriteNode
//

extension CGRect {
  var center: CGPoint { return CGPoint(x: midX, y: midY) }
  var min:    CGPoint { return CGPoint(x: minX, y: minY) }
  var max:    CGPoint { return CGPoint(x: maxX, y: maxX) }
}

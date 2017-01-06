//
//  ToolbarButtons.swift
//  Game Maker 2.0
//
//  Created by Dude Guy  on 1/4/17.

import SpriteKit


// MARK: - TOOLBARBUTTON.SWIFT

// FIXME: Where does this belong?
fileprivate func failedErrorCheck(_ riskyPrompt: Prompt? = ux.currentPrompt) -> Bool {
  guard let prompt = riskyPrompt else { print("fec: found nil"); return true  }
  if prompt.isInitialized == false    { print("fec: not init" ); return true  }
  else                                { print("fec: good 2 go"); return false }
}

// NOTE: Subclasses' respective same-named function will run on overriden touchesBegan().
enum ToolbarButtons {
  
  typealias DidSucceed = Bool
 
  // Add option to current prompt:
  final class AddChoice: SKSpriteNode {

    typealias  this = ToolbarButtons.AddChoice
    
    static var id = 1
    
    var name2: String? = "default choice"
    
    func addChoice(to prompt: Prompt) -> DidSucceed {
      // TODO: << Too much logic.. needs declarative >>
      
      // FIXME: I don't know what I'm doing with this yet...
      guard let state = ux.currentState else { fatalError("ac: How did we get nil?") }
      guard state == .overview else { print("ac: wrong state"); return false }
      
      let choice = Choice(texture: textToTexture( text: "choice \(this.id)", color: .black),
                          size:    CGSize( width: 100, height: 50) )
      choice.initialize()

      guard choice.isInitialized else { print("ac: not init"); return false }
      
      guard let choiceCount = prompt.choices?.count else {  // First choice:
        prompt.choices = [choice]
        prompt.addChild(choice)
        
        choice.position.x -= 75
        choice.touchOverview()
        return true
      }
      
      if choiceCount < prompt.config_maxChoices {  // Subsequent choices:
        prompt.choices!.append(choice)
        prompt.addChild(choice)
        
        choice.position.x += 75
        choice.touchOverview()
        return true
      }
      
      else {  // Max choices:
        print("tbb: can't add any more choices to \(prompt.name)")
        return false
      }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      var result = false
      defer { result ? print("tbb: successfully added choice") : print("tbb: did not add choice!") }
      
      if failedErrorCheck() { return }
      else { result = addChoice(to: ux.currentPrompt!) }
      
      if result { this.id += 1 }
    }
  }
}

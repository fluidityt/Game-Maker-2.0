import SpriteKit

/// Testing:
public func didMoveToView() {
  Sys.ineet()
  Sys.status()

setupProcessComments: do {
  /**
   part 1:
   - make super holder
   - make super prompt
   - make choice holder
   - add choice holder to super prompt
   - place super prompt in super holder
   - register in .holders
   
   part 2:
   - select super prompt
   - action: make new, default choice
   - make new prompt holder
   - add prompt holder to choice
   - add default choice to super prompt's choice holder
   - register in .holders
   
   part 3:
   - select default choice
   - action: make new, default prompt
   - make new choice holder
   - add choice holder to new prompt
   - add new prompt to choice's prompt holder
   - register in .holders

 How do I register this? OH right, a search algo =/ or threaded while..
   solutions:
   - thread an updater that goes through and assigns a grid location
   - check relative Y positions (no way X could work)
   - check for number of parents (thus giving you row #)
   - if you know the position of one thing, then the immediate things around
     it you should know too.. such as if you add a new thing to that known
     thing or, if you delete from that known thing--you will know where you are.
   - cache nearby shit (scenes?)
   */
  }
  
  todoComments: do {
    // TODO: TODO:
    /**
     TODO:
     - make gameover default node
     - put holder code inside prompt and choice inits
    */
  }
}

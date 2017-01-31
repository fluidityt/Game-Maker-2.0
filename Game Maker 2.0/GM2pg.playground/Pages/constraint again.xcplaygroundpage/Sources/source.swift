import SpriteKit
func newLine() { print("\n") }

/// Classes:
class InGameElement: SKSpriteNode {
  final var
  title: String,
  childHolder: Holder
  
  init(title: String, color: SKColor, size: CGSize) {
    super.init(texture: nil, color: color, size: size)
    self.title = title
    
  }                                                                                 ; required init?(coder aDecoder: NSCoder) { super.init(texture: nil, color: .black, size: CGSize.zero) }
};

final class Prompt: InGameElement {
  /// Holder should be created but with a GAME OVER content
  let childHolder = ChoiceHolder()
  
  func childChoices() -> [Choice] {
    var choices = [Choice]()
    for child in children[0].children {
      choices.append(child as! Choice)
    }
    return choices
  }
  
  init(title: String) {
    super.init(title: title, color: .red, size: CGSize(width: 50, height: 50))
  }                                                                                 ; required init?(coder aDecoder: NSCoder) {super.init(coder: NSCoder())}
  
};

final class Choice: InGameElement {
  
  let childHolder =
  
  func childPrompt() -> Prompt { return children[0].children[0] as! Prompt }
  
  init(title: String) {
    super.init(title: title, color: .yellow, size: CGSize(width: 100, height: 50))
  }                                                                                 ; required init?(coder aDecoder: NSCoder) {super.init(coder: NSCoder())}
  
};


class Holder: SKSpriteNode {
};

final class PromptHolder: Holder {
  var prompts = [Prompt]()
};



final class ChoiceHolder: Holder {
  var choices = [Choice]()
};




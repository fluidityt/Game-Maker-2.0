import SpriteKit
func newLine() { print("\n") }

/// Classes:
class InGameElement: SKSpriteNode {
  final var title = String(),
            node = SKNode()
  
  init(title: String, color: SKColor, size: CGSize) {
    super.init(texture: nil, color: color, size: size)
    self.title = title
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(texture: nil, color: .black, size: CGSize.zero)
  }
};

final class Prompt: InGameElement {
  
  var childChoices: [Choice] {
    var choices = [Choice]()
    for child in children[0].children {
      choices.append(child as! Choice)
    }
    return choices
  }
  
  init(title: String) {
    super.init(title: title, color: .red, size: CGSize(width: 50, height: 50))
  }
  
  required init?(coder aDecoder: NSCoder) {super.init(coder: NSCoder())}
  
};

/// FIXME: SHould be a holder member..
final class Choice: InGameElement {
  
  var childPrompt: Prompt { return children[0].children[0] as! Prompt }
  
  init(title: String) {
    super.init(title: title, color: .yellow, size: CGSize(width: 100, height: 50))
  }
  
  required init?(coder aDecoder: NSCoder) {super.init(coder: NSCoder())}
  
};


///********************************///

/// FIXME: Holders this needs work...:
class Holder {
  final var node = SKShapeNode()
};

final class PromptHolder: Holder {
  var prompts = [Prompt]()
};

final class ChoiceHolder: Holder {
  var choices = [Choice]()
};




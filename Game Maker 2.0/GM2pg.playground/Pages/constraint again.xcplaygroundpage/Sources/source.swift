import SpriteKit
func newLine() { print("\n") }
// MARK: - IGEs:

/// All these should be used for the ingame stuf:
class InGameElement: SKSpriteNode {
  final var title = ""
  
  init(title: String, color: SKColor, size: CGSize) {
    self.title = title
    super.init(texture: nil, color: color, size: size)
  }                                                   ; required init?(coder aDecoder: NSCoder) { super.init(texture: nil, color: .black, size: CGSize.zero) }
};

final class Prompt: InGameElement {
  
  static let superPromptTitle = "SuperPrompt"
  
  init(title: String) {
    /// Holder should be created but with a GAME OVER content
    super.init(title: title, color: .red, size: CGSize(width: 50, height: 50))
  }                                                                                 ; required init?(coder aDecoder: NSCoder) {super.init(coder: NSCoder())}
};

final class Choice: InGameElement {
  
  init(title: String) {
    super.init(title: title, color: .yellow, size: CGSize(width: 100, height: 50))
  }                                                                                 ; required init?(coder aDecoder: NSCoder) {super.init(coder: NSCoder())}
};


// MARK: - Holders:
class Holder: SKSpriteNode {

};

final class PromptHolder: Holder {
  
};

final class ChoiceHolder: Holder {

};

final class RefHolder {
  var val = Holder()
};

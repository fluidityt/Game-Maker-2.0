import SpriteKit
func newLine() { print("\n") }

/// Classes:
class InGameElement {
  final var title = String(),
            node = SKNode()
  
  init(title: String) { self.title = title }
};

final class Prompt: InGameElement {
  var subsequentChoiceHolder = ChoiceHolder()
};

/// FIXME: SHould be a holder member..
final class Choice: InGameElement {
  var subsequentPrompt = Prompt(title: "default prompt")
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





class Cat {
  var name = ""
  func meow() { print(name) }
  init(name: String) { self.name = name }
}

var myCat = Cat(name: "fluffy")
func catty() -> Cat { return myCat }

myCat.meow()

var newCat = catty()

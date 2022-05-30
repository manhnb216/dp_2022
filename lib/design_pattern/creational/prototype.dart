
abstract class Clonable {
  String? name;

  Clonable(this.name);

  Clonable.clone(Clonable clonable) {
    name = clonable.name;
  }

  Clonable clone();
  void resetName(String newName);
}

class Prototype extends Clonable {
  Prototype(String name) : super(name);

  Prototype.init() : super('prototype name');

  Prototype.clone(Prototype prototype) : super.clone(prototype);

  @override
  Clonable clone() {
    return Prototype.clone(this);
  }

  @override
  void resetName(String newName) {
    name = newName;
  }
}

import 'dart:developer';

enum TypeShape { rectangle, circle }

abstract class Shape {
  void draw();
}

class Rectangle implements Shape {
  late final String name;
  Rectangle(this.name);
  @override
  void draw() {
    log('draw rectangle $name');
  }
}

class Circle implements Shape {
  @override
  void draw() {
    log('draw circle');
  }
}

class FactoryMethod {
  static Shape createShape(TypeShape typeShape, String name) {
    switch (typeShape) {
      case TypeShape.rectangle:
        return Rectangle(name);
      case TypeShape.circle:
        return Circle();
    }
  }
}

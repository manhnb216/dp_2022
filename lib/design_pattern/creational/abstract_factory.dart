import 'dart:developer';

///
enum TypeClothes { cotton, silk }

class ClothesFactory {
  static ClothesAbstractFactory createAbstractFactory(TypeClothes typeClothes) {
    switch (typeClothes) {
      case TypeClothes.cotton:
        return CottonClothes();
      case TypeClothes.silk:
        return SilkClothes();
    }
  }
}

abstract class ClothesAbstractFactory {
  Trousers createTrouser();
  Shirt createShirt();
}

class CottonClothes implements ClothesAbstractFactory {
  @override
  Shirt createShirt() {
    return Tshirt();
  }

  @override
  Trousers createTrouser() {
    return Shorts();
  }
}

class SilkClothes implements ClothesAbstractFactory {
  @override
  Shirt createShirt() {
    return Polo();
  }

  @override
  Trousers createTrouser() {
    return Pants();
  }
}

///
abstract class Trousers {
  void massProd();
}

class Pants implements Trousers {
  @override
  void massProd() {
    log('+1 pants');
  }
}

class Shorts implements Trousers {
  @override
  void massProd() {
    log('+1 shorts');
  }
}

///
abstract class Shirt {
  void massProd();
}

class Tshirt implements Shirt {
  @override
  void massProd() {
    log('+1 T-shirt');
  }
}

class Polo implements Shirt {
  @override
  void massProd() {
    log('+1 polo');
  }
}

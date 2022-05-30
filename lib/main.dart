import 'dart:developer';

import 'package:dp_2022/design_pattern/creational/abstract_factory.dart';
import 'package:dp_2022/design_pattern/creational/builder.dart';
import 'package:dp_2022/design_pattern/creational/factory_method.dart';
import 'package:dp_2022/design_pattern/creational/prototype.dart';
import 'package:dp_2022/design_pattern/creational/singleton.dart';
import 'package:dp_2022/design_pattern/structural/adapter.dart';
import 'package:dp_2022/design_pattern/structural/bridge.dart';
import 'package:dp_2022/design_pattern/structural/composite.dart';
import 'package:dp_2022/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

  /**
   * Creational pattern
   */

  // 1. Singleton
  Singleton singleton1 = Singleton();
  Singleton singleton2 = Singleton();
  log((singleton1 == singleton2).toString());
  log(identical(singleton1, singleton2).toString());
  log('----------');

  // 2. Factory Method
  Shape shape1 = FactoryMethod.createShape(TypeShape.rectangle, 'hihi');
  Shape shape2 = FactoryMethod.createShape(TypeShape.circle, '');
  shape1.draw();
  shape2.draw();
  log('----------');

  // 3. Abstract Factory
  ClothesAbstractFactory cottonFactory =
      ClothesFactory.createAbstractFactory(TypeClothes.cotton);
  ClothesAbstractFactory silkFactory =
      ClothesFactory.createAbstractFactory(TypeClothes.silk);

  Trousers trousers1 = cottonFactory.createTrouser();
  Shirt shirt1 = cottonFactory.createShirt();
  Trousers trousers2 = silkFactory.createTrouser();
  Shirt shirt2 = silkFactory.createShirt();
  trousers1.massProd();
  shirt1.massProd();
  trousers2.massProd();
  shirt2.massProd();
  log('----------');

  // 4. Builder
  Order order = OrderBuilderImpl()
      .orderType(OrderType.onSite)
      .breadType(BreadType.simple)
      .build();
  log(order.toString());
  log('----------');

  // 5. Prototype
  Clonable clonable = Prototype.init();
  log(clonable.name.toString());
  Clonable clonableCopy = clonable.clone();
  log(clonableCopy.name.toString());
  clonableCopy.resetName('new name for copy');
  log(clonableCopy.name.toString());
  log('----------');

  //--------------------
  /**
   * Structural pattern
   */

  // 6. Adapter
  AdapterSac adapterSac = CucSacBaChan(ODienHaiChan());
  adapterSac.camSac('Cam sac');
  log('----------');

  // 7. Bridge ( i use it with Factory Method Pattern )
  Bank vcb = VCB(AccountFactory.open(AccountType.checking));
  Bank tpb = TPB(AccountFactory.open(AccountType.saving));
  vcb.openAccount();
  tpb.openAccount();
  log('----------');

  // 8. Composite
  FileLeaf fileLeafImpl1 = FileLeafImpl.init();
  FileLeaf fileLeafImpl2 = fileLeafImpl1.clone();
  fileLeafImpl2.setName('hihi');
  fileLeafImpl2.setSize(10);
  List<FileLeaf> files = [fileLeafImpl1, fileLeafImpl2];
  FileComponent folder = FileComposite(files);
  folder.showProperty();
  log('Total size: ${folder.totalSize()}');
  log('----------');
}

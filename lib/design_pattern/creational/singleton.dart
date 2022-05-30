import 'package:equatable/equatable.dart';

class Singleton extends Equatable {
  static const Singleton _instance = Singleton._init();

  factory Singleton() {
    return _instance;
  }

  const Singleton._init();

  @override
  List<Object?> get props => [];
}

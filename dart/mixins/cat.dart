import 'animals.dart';

mixin Cat implements Animals {
  @override
  void makeSound() {
    print("From Cat");
  }
}

// class Cat extends Animals {}

// void main() {
//   Cat cat = Cat();
//   cat.makeSound();
// }

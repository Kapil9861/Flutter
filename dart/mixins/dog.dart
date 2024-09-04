import 'animals.dart';
import 'cat.dart';

class Dog extends Animals with Cat {}

void main() {
  Dog dog = Dog();
  dog.makeSound();
}

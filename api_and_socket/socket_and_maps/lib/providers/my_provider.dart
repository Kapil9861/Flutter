import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  List<int> numbers = [1, 2, 3, 4, 5];
  void handleChange(String operation) {
    if (operation == "add") {
      int toUpdate = numbers.last;
      numbers.add(toUpdate + 1);
    } else {
      numbers.removeLast();
    }
    notifyListeners();
  }
}

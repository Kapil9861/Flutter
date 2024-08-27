import 'package:flutter/material.dart';
import 'package:riverpod_tutorial/data/models/user.dart';

class UserNotifier extends ChangeNotifier {
  UserNotifier(this._user);
  User _user;

  User get user => _user;

  void updateUser(String username, String id) {
    _user = _user.copyWith(id: id, username: username);
    notifyListeners();
  }

  void updateName(String name) {
    _user = _user.copyWith(username: name);
    notifyListeners();
  }

  void updateId(String id) {
    _user = _user.copyWith(id: id);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/data/models/user_model.dart';
import 'package:veda_news/domain/usecases/auth/login.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, UserModel>((ref) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<UserModel> {
  LoginNotifier() : super(const UserModel());
  final _login = Login();

  Future<void> login({
    required String password,
    required String username,
    String? rememberToken,
    required BuildContext conext,
  }) async {
    final loginState = await _login.login(
      password: password,
      username: username,
      rememberToken: rememberToken,
    );
    state = loginState;
  }
}

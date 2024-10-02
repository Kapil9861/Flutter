import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/authentication/data/models/login_data_model.dart';
import 'package:main_app/authentication/domain/use_cases/login.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginData>((ref) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<LoginData> {
  LoginNotifier() : super(const LoginData());
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

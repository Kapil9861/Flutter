import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/authentication/data/models/user.dart';
import 'package:veda_news/authentication/domain/use_cases/login.dart';
import 'package:veda_news/core/utils.dart';

final loginProvider = StateNotifierProvider<LoginStateNotifier, User>((ref) {
  return LoginStateNotifier(
    const User(id: 0, name: "Guest", email: "guest@guest.com"),
  );
});

final tokenProvider = StateProvider<String>((ref) {
  return "";
});

class LoginStateNotifier extends StateNotifier<User> {
  LoginStateNotifier(super.state);
  Future login(BuildContext context, WidgetRef ref,
      {required String email,
      required String password,
      required String deviceName}) async {
    final login = Login();
    final authData = await login.login(
      email: email,
      password: password,
      deviceName: deviceName,
    );
    if (authData['errorMessage'] != null) {
      showSnackbar(context, authData['errorMessage']);
    } else if (authData['message'] != null) {
      showSnackbar(context, authData['message']);
      final user = User.fromJson(authData['user']);
      final token = authData['token'];
      state = user;
    } else {
      showSnackbar(context, "Something went wrong at authentication provider!");
    }
  }
}

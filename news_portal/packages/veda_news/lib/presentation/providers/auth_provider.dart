import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/data/datasource/drift/auth_datasource.dart';
import 'package:veda_news/data/repositories/auth_repository_impl.dart';
import 'package:veda_news/domain/repositories/auth_repository.dart';
import 'package:veda_news/domain/usecases/auth/login.dart';
import 'package:veda_news/domain/usecases/auth/register.dart';

final datasourceProvider = Provider<AuthDatasource>((ref) {
  return AuthDatasource();
});

final authRepoProvider = Provider<AuthRepository>((ref) {
  final resource = ref.watch(datasourceProvider);

  return AuthRepositoryImpl(resource);
});
final loginProvider = StateNotifierProvider<LoginNotifier, User>((ref) {
  final repo = ref.watch(authRepoProvider);
  final login = Login(repo);
  return LoginNotifier(login);
});

final registerProvider = ChangeNotifierProvider<RegisterNotifier>((ref) {
  final repo = ref.watch(authRepoProvider);
  final register = Register(repo);
  return RegisterNotifier(register);
});

class RegisterNotifier extends ChangeNotifier {
  final Register reg;

  RegisterNotifier(this.reg);
  String message = "";
  Future<void> register(
      {required String fullname,
      required String username,
      required String password,
      required String phoneNumber,
      String? email,
      String? resetPasswordExpiration,
      String? sessionId,
      String? rememberToken,
      bool? isDeleted}) async {
    message = await reg.call(
      fullname: fullname,
      username: username,
      password: password,
      phoneNumber: phoneNumber,
      email: email,
      isDeleted: isDeleted,
      rememberToken: rememberToken,
      resetPasswordExpiration: resetPasswordExpiration,
      sessionId: sessionId,
    );
  }
}

class LoginNotifier extends StateNotifier<User> {
  LoginNotifier(this.usecase)
      : super(
          const User(
              userName: "",
              fullName: "",
              password: "",
              phoneNumber: "",
              isDeleted: true),
        );
  final Login usecase;
  Future<void> login({
    required BuildContext context,
    required String password,
    required String username,
    String? rememberToken,
    required BuildContext conext,
  }) async {
    final loginState = await usecase.login(
      password: password,
      username: username,
      rememberToken: rememberToken,
    );
    if (loginState == null) {
      CustomSnackbar()
          .show(context, "User not found! \nAre you sure you registered?");
    } else {
      state = loginState;
    }
  }
}

import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/application/data/data_sources/users_datasource.dart';
import 'package:main_app/application/data/repositories/user_repository_impl.dart';
import 'package:main_app/application/domain/repositories/user_repository.dart';
import 'package:main_app/application/domain/usecases/user/add_user.dart';
import 'package:main_app/application/domain/usecases/user/get_user_detail.dart';
import 'package:main_app/application/domain/usecases/user/update_user.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.watch(userDatasourceProvider));
});

final userDatasourceProvider = Provider<UsersDatasource>(
  (ref) {
    return UsersDatasource();
  },
);

final addUserProvider = ChangeNotifierProvider<AddUserNotifier>((ref) {
  final repo = ref.read(userRepositoryProvider);
  final addUser = AddUser(repo);
  return AddUserNotifier(addUser);
});

final userDetailProvider = ChangeNotifierProvider<GetUserChangeNotifier>((ref) {
  final repo = ref.read(userRepositoryProvider);
  final userDetail = GetUserDetail(repo);
  return GetUserChangeNotifier(userDetail);
});

final updateUserProvider =
    StateNotifierProvider<UpdateUserNotifierProvider, String>((ref) {
  final repo = ref.watch(userRepositoryProvider);
  final update = UpdateUser(repo);
  return UpdateUserNotifierProvider("", update);
});

class UpdateUserNotifierProvider extends StateNotifier<String> {
  UpdateUserNotifierProvider(super.state, this.user);
  final UpdateUser user;

  Future<void> updateUser(
    BuildContext context, {
    required String phoneNumber,
    String? dob,
    Genders? gender,
    String? name,
  }) async {
    final message = await user.call(
      phoneNumber: phoneNumber,
      dob: dob,
      gender: gender,
      name: name,
    );
    state = message;
    if (message.contains("success")) {
      CustomAnimatedSnackbar.show(message, context: context);
    } else {
      CustomAnimatedSnackbar.show(message, context: context);
    }
  }
}

class GetUserChangeNotifier extends ChangeNotifier {
  final GetUserDetail detail;

  GetUserChangeNotifier(this.detail);
  User user = const User(
    id: "initial-state",
    name: "",
    gender: Genders.male,
    phoneNumber: "",
  );

  void getUser(String phoneNumber) async {
    final updatedUser = await detail.call(phoneNumber);
    if (updatedUser.phoneNumber.isNotEmpty &&
        updatedUser.name.isNotEmpty &&
        updatedUser.id != "initial-state") {
      user = updatedUser;
    }
    notifyListeners();
  }
}

class AddUserNotifier extends ChangeNotifier {
  final AddUser addUser;

  AddUserNotifier(this.addUser);
  int number = 0;
  Future<void> add(BuildContext context, User user) async {
    try {
      final updatedState = await addUser.call(user);
      if (updatedState > 0) {
        number = updatedState;
        CustomAnimatedSnackbar.show(
          "User Added Successfully!",
          context: context,
        );
      } else {
        CustomAnimatedSnackbar.show(
          "Could not add user!",
          context: context,
        );
      }
    } on Exception catch (e) {
      CustomAnimatedSnackbar.show(
        "Error: ${e.toString()}",
        context: context,
      );
    } finally {
      notifyListeners();
    }
  }
}

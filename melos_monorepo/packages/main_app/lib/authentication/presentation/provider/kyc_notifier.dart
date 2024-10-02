import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';
import 'package:main_app/authentication/domain/use_cases/add_kyc.dart';
import 'package:main_app/authentication/domain/use_cases/check_kyc_completion.dart';
import 'package:main_app/authentication/domain/use_cases/get_kyc_info.dart';
import 'package:main_app/authentication/domain/use_cases/update_kyc.dart';

final dropDownProvider = StateProvider<String>((ref) {
  return "male";
});

final addPersonalInfoProvider =
    StateNotifierProvider<AddPersonalInfoNotifier, int>((ref) {
  return AddPersonalInfoNotifier(1);
});

class AddPersonalInfoNotifier extends StateNotifier<int> {
  AddPersonalInfoNotifier(super.state);
  Future<void> addPersonalRecords(KnowYourCustomerData kyc) async {
    final addKyc = AddKyc();
    final id = await addKyc.add(kyc);
    state = id;
  }
}

final addParentsInfoProvider =
    StateNotifierProvider<AddParentsInfoProvider, int>((ref) {
  return AddParentsInfoProvider(1);
});

class AddParentsInfoProvider extends StateNotifier<int> {
  AddParentsInfoProvider(super.state);
  final updateKyc = UpdateKyc();

  Future<void> addParents(
      String phoneNumber, String motherName, String fatherName) async {
    final id = await updateKyc.update(phoneNumber, motherName, fatherName);
    state = id;
  }
}

final checkKycCompletionProvider =
    ChangeNotifierProvider<CheckKycCompletionNotifier>((ref) {
  return CheckKycCompletionNotifier();
});

class CheckKycCompletionNotifier extends ChangeNotifier {
  bool result = false;
  Future<void> checkKycCompletion(String phoneNumber) async {
    final kycCompletionChecker = CheckKycCompletion();
    bool isCompleted = await kycCompletionChecker.check(phoneNumber);
    result = isCompleted;
    notifyListeners();
  }
}

final getKycInfoProvider =
    StateNotifierProvider<KycInfoNotifier, KnowYourCustomerData>(
  (ref) {
    return KycInfoNotifier(
      KnowYourCustomerData(
        // id: 0,
        dateOfBirth: DateTime.now(),
        gender: "Male",
        firstName: "InitialState",
        lastName: "Initial State",
        phoneNumber: "No phone number",
      ),
    );
  },
);

class KycInfoNotifier extends StateNotifier<KnowYourCustomerData> {
  KycInfoNotifier(super.state);

  final getKycData = GetKycInfo();
  Future<void> getInfo(String phoneNumber, BuildContext context) async {
    final kycInfo = await getKycData.getKycInfo(phoneNumber, context);
    state = kycInfo;
  }

  Stream<List<KnowYourCustomerData>> lll(String phoneNumber) {
    return getKycData.getExisitingDataAsStream(phoneNumber);
  }
}

final isLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

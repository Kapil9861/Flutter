import 'package:flutter/material.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';
import 'package:core/core.dart';

class KycDatasource {
  final database = MyDatabase();
  Future<int> addPersonalInfo(KnowYourCustomerData kyc) async {
    final data = await database.insertKyc(kyc);
    return data;
  }

  Future<int> addParentsInfo(
      String phoneNumber, String motherName, String fatherName) async {
    return await database.updateWithParentsInfo(
        phoneNumber, motherName, fatherName);
  }

  Future<bool> checkKycCompletion(String phoneNumber) async {
    final data = await database.getExistingData(phoneNumber);
    if (data == null) {
      return false;
    }
    if (data.motherName != null && data.fatherName != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<KnowYourCustomerData> getKycInfo(
      String phoneNumber, BuildContext context) async {
    final data = await database.getExistingData(phoneNumber);
    if (data == null) {
      //   const message = "The result is not found: null data!";
      //   if (context.mounted) {
      //     CustomAnimatedSnackbar.show(
      //       message,
      //       context: context,
      //       type: AnimatedSnackBarType.error,
      //       backgroundColor: Colors.red,
      //     );
      //   }
      throw GetKYCInfoError("The data for $phoneNumber is not found!");
    }
    return data;
  }

  Future<void> deleteKyc(String phoneNumber, BuildContext context) async {
    await database.deleteKyc(phoneNumber, context);
  }

  Stream<List<KnowYourCustomerData>> getExisitingDataAsStream(
    String phoneNumber,
  ) {
    return database.getExisitingDataAsStream(phoneNumber);
  }
}

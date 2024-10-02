import 'package:flutter/material.dart';
import 'package:main_app/authentication/data/datasources/kyc_datasource.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class GetKycInfo {
  final source = KycDatasource();
  Future<KnowYourCustomerData> getKycInfo(
      String phoneNumber, BuildContext context) async {
    final data = await source.getKycInfo(phoneNumber, context);
    return data;
  }

  Stream<List<KnowYourCustomerData>> getExisitingDataAsStream(
    String phoneNumber,
  ) {
    return source.getExisitingDataAsStream(phoneNumber);
  }
}

import 'package:flutter/material.dart';
import 'package:main_app/authentication/data/datasources/kyc_datasource.dart';

class DeleteKyc {
  final source = KycDatasource();
  Future<void> delete(String phoneNumber, BuildContext context) async {
    await source.deleteKyc(phoneNumber, context);
  }
}

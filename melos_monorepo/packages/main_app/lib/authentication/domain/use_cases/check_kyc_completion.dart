import 'package:main_app/authentication/data/datasources/kyc_datasource.dart';

class CheckKycCompletion {
  final source = KycDatasource();
  Future<bool> check(String phoneNumber) async {
    final isVerified = await source.checkKycCompletion(phoneNumber);
    // print("isVerified : $isVerified");
    return isVerified;
  }
}

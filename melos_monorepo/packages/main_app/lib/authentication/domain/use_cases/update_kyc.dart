import 'package:main_app/authentication/data/datasources/kyc_datasource.dart';

class UpdateKyc {
  final source = KycDatasource();
  Future<int> update(
      String phoneNumber, String motherName, String fatherName) async {
    return await source.addParentsInfo(phoneNumber, motherName, fatherName);
  }
}

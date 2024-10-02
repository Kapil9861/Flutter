import 'package:main_app/authentication/data/datasources/kyc_datasource.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class AddKyc {
  final source = KycDatasource();
  Future<int> add(KnowYourCustomerData kyc) async {
    return await source.addPersonalInfo(kyc);
  }
}

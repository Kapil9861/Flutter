import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';
import 'package:main_app/authentication/domain/use_cases/get_kyc_info.dart';

final kycInfo = GetKycInfo();

final existingDataProvider =
    StreamProvider.family<List<KnowYourCustomerData>, String>(
  (ref, phoneNumber) {
    return kycInfo.getExisitingDataAsStream(phoneNumber);
  },
);

final forParentsSameProvider =
    StreamProvider.family<List<KnowYourCustomerData>, String>(
  (ref, phoneNumber) {
    return kycInfo.getExisitingDataAsStream(phoneNumber);
  },
);

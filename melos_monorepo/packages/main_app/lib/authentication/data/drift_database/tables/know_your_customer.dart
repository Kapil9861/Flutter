import 'package:drift/drift.dart';

class KnowYourCustomer extends Table {
  TextColumn get phoneNumber =>
      text().customConstraint("UNIQUE NOT NULL").withLength(min: 10, max: 14)();
  TextColumn get firstName => text().withLength(min: 3, max: 20)();
  TextColumn get middleName => text().withLength(min: 3, max: 20).nullable()();
  TextColumn get lastName => text().withLength(min: 3, max: 20)();
  DateTimeColumn get dateOfBirth => dateTime()();
  TextColumn get motherName => text().withLength(min: 5, max: 36).nullable()();
  TextColumn get fatherName => text().withLength(min: 5, max: 36).nullable()();
  TextColumn get gender => text().nullable()();
}

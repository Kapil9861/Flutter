import 'package:drift/drift.dart';

class Users extends Table {
  @override
  String get tableName => "users";
  TextColumn get userName => text().withLength(min: 3, max: 30)();
  TextColumn get fullName => text().withLength(min: 3, max: 30)();

  TextColumn get password => text().withLength(min: 6, max: 20)();
  TextColumn get phoneNumber => text().withLength(min: 10, max: 15)();
  TextColumn get email => text().withLength(min: 11, max: 32).nullable()();
  TextColumn get resetPasswordExpiration =>
      text().withLength(min: 3, max: 30).nullable()();
  TextColumn get rememberToken =>
      text().withLength(min: 3, max: 30).nullable()();
  TextColumn get sessionId => text().withLength(min: 3, max: 30).nullable()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

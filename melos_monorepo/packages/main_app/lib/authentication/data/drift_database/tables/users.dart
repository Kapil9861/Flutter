import 'package:core/core.dart';
import 'package:drift/drift.dart';

class Users extends Table {
  @override
  String get tableName => "users";

  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 6, max: 40)();
  TextColumn get dateOfBirth => text().nullable()();
  TextColumn get gender => textEnum<Genders>()();
  TextColumn get phoneNumber => text().customConstraint("UNIQUE NOT NULL")();

  @override
  Set<Column> get primaryKey => {id};
}

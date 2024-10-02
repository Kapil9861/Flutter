import 'package:drift/drift.dart';
import './users.dart';

class Employees extends Table {
  @override
  String get tableName => "employees";
  TextColumn get userId =>
      text().customConstraint("REFERENCES users(id) NOT NULL UNIQUE")();
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isActive => boolean().nullable()();
  IntColumn get salary => integer()();
  TextColumn get designation => text()();
}
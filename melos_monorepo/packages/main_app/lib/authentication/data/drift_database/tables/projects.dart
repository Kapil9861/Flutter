import 'package:core/core.dart';
import 'package:drift/drift.dart';

class Projects extends Table {
  @override
  String get tableName => "projects";
  TextColumn get id => text()();
  TextColumn get projectName => text().withLength(min: 3, max: 40).unique()();
  TextColumn get type => textEnum<ProjectType>()();
  @override
  Set<Column> get primaryKey => {id};
}

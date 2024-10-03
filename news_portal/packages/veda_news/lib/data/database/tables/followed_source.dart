import 'package:drift/drift.dart';

class FollowedSource extends Table {
  @override
  String get tableName => "followedSource";
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sourceId => text()();
  TextColumn get sourceName => text().nullable()();
}

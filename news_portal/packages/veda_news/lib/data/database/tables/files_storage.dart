import 'package:drift/drift.dart';

class FilesStorage extends Table {
  @override
  String get tableName => "files";

  IntColumn get id => integer().autoIncrement()();
  BlobColumn get media => blob()();
}

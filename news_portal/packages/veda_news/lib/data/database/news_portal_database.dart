import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:veda_news/data/database/tables/favourites.dart';
import 'package:veda_news/data/database/tables/followed_source.dart';

part 'news_portal_database.g.dart';

@DriftDatabase(tables: [Favourites, FollowedSource])
class NewsPortalDatabase extends _$NewsPortalDatabase {
  NewsPortalDatabase._privateConstructor() : super(_openConnection());

  static final NewsPortalDatabase _instance =
      NewsPortalDatabase._privateConstructor();

  factory NewsPortalDatabase() {
    return _instance;
  }

  @override
  int get schemaVersion => 1;
}

// Function to open the database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final folder = await getApplicationDocumentsDirectory();
    final filePath = File(p.join(folder.path, "databaseSchema"));
    return NativeDatabase.createInBackground(filePath);
  });
}

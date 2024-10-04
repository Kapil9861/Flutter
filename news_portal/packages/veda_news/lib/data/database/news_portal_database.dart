import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
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
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        if (kDebugMode) {
          print(details);
        }
      },
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          await m.createTable(favourites);
          await m.createTable(followedSource);
        }
      },
    );
  }

  Future<int> addFavouriteArticle(FavouritesCompanion favourite) async {
    final query = await (into(favourites).insert(favourite));
    return query;
  }

  Future<int> addFollowedSource(FollowedSourceCompanion source) async {
    return await (into(followedSource).insert(source));
  }

  Future<int> removeFollowedSource(int sourceId) async {
    final query = await (delete(favourites)
          ..where((table) => table.id.equals(sourceId)))
        .go();
    return query;
  }

  Future<int> removeFavouriteArticle(int id) async {
    final query = await (delete(followedSource)
          ..where((table) => table.id.equals(id)))
        .go();
    return query;
  }

  Stream<List<FollowedSourceData>> getFollowedSources() {
    return (select(followedSource).watch());
  }

  Stream<List<Favourite>> getFavouriteArticle() {
    return (select(favourites).watch());
  }
}

// Function to open the database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final folder = await getApplicationDocumentsDirectory();
    final filePath = File(p.join(folder.path, "databaseSchema"));
    return NativeDatabase.createInBackground(filePath);
  });
}
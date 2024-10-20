import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:veda_news/data/database/tables/favourites.dart';
import 'package:veda_news/data/database/tables/followed_source.dart';
import 'package:veda_news/data/database/tables/users.dart';

part 'news_portal_database.g.dart';

@DriftDatabase(tables: [Favourites, FollowedSource, Users])
class NewsPortalDatabase extends _$NewsPortalDatabase {
  NewsPortalDatabase._privateConstructor() : super(_openConnection());

  static final NewsPortalDatabase _instance =
      NewsPortalDatabase._privateConstructor();

  factory NewsPortalDatabase() {
    return _instance;
  }

  @override
  int get schemaVersion => 2;
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
        if (from < 3) {
          await m.createTable(users);
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

  Future<int> removeFollowedSource(String sourceId) async {
    final query = await (delete(followedSource)
          ..where((table) => table.sourceId.equals(sourceId)))
        .go();
    return query;
  }

  Future<int> removeFavouriteArticle(int id) async {
    final query = await (delete(followedSource)
          ..where((table) => table.id.equals(id)))
        .go();

    return query;
  }

  Future<User?> login(String username, String password) async {
    final query = await (select(users)
          ..where((user) =>
              user.userName.equals(username) &
              (user.password.equals(password))))
        .getSingleOrNull();
    return query;
  }

  Future<String> register({
    required String fullname,
    required String username,
    required String password,
    required String phoneNumber,
    String? email,
    String? resetPasswordExpiration,
    String? sessionId,
    String? rememberToken,
    bool? isDeleted,
  }) async {
    final query = await into(users).insert(
      UsersCompanion(
        userName: Value(username),
        email: Value(email),
        password: Value(password),
        fullName: Value(fullname),
        phoneNumber: Value(phoneNumber),
        isDeleted: Value(isDeleted ?? false),
        rememberToken: Value(rememberToken),
      ),
    );
    if (query.isNegative) {
      return "Could Not Register User!";
    } else {
      return "User Registration Completed Successfully!";
    }
  }

  Future<bool> removeFavourite(String title) async {
    final query = await (delete(favourites)
          ..where(
            (table) => table.title.equals(title),
          ))
        .go();
    if (query > 0) {
      return true;
    } else {
      return false;
    }
  }

  Stream<List<FollowedSourceData>> getFollowedSources() {
    return (select(followedSource).watch());
  }

  Stream<List<Favourite>> getFavouriteArticle() {
    return (select(favourites).watch());
  }

  Stream<List<Favourite>> likedStream(String title) {
    return (select(favourites)
          ..where(
            (tbl) => tbl.title.equals(title),
          ))
        .watch();
  }

  Stream<List<FollowedSourceData>> followedSources(String sourceId) {
    return (select(followedSource)
          ..where(
            (source) => source.sourceId.equals(sourceId),
          ))
        .watch();
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

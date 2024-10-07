import 'package:veda_news/data/database/news_portal_database.dart';

class FollowedSourceDatasource {
  final _database = NewsPortalDatabase();
  Stream<List<FollowedSourceData>> getFollowedSources() {
    return _database.getFollowedSources();
  }

  Future<int> addFollowedSource(FollowedSourceCompanion source) async {
    return await _database.addFollowedSource(source);
  }

  Future<int> removeFollowedSource(String id) async {
    return await _database.removeFollowedSource(id);
  }
}

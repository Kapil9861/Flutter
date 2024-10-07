import 'package:veda_news/data/database/news_portal_database.dart';

abstract class DriftFollowedSourcesRepository {
  Stream<List<FollowedSourceData>> getFollowedSources();
  Future<int> addFollowedSource(FollowedSourceCompanion source);
  Future<int> removeFollowedSource(String id);
}

import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/data/datasource/drift/followed_source_datasource.dart';
import 'package:veda_news/domain/repositories/drift_followed_sources_repository.dart';

class DriftFollowedSourcesRepositoryImpl
    implements DriftFollowedSourcesRepository {
  final FollowedSourceDatasource dataSource;

  DriftFollowedSourcesRepositoryImpl(this.dataSource);

  @override
  Stream<List<FollowedSourceData>> getFollowedSources() {
    return dataSource.getFollowedSources();
  }

  @override
  Future<int> removeFollowedSource(String id) async {
    return await dataSource.removeFollowedSource(id);
  }

  @override
  Future<int> addFollowedSource(FollowedSourceCompanion source) async {
    return await dataSource.addFollowedSource(source);
  }
}

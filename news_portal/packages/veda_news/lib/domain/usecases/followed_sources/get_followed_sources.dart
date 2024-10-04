import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/domain/repositories/drift_followed_sources_repository.dart';

class GetFollowedSources {
  final DriftFollowedSourcesRepository repository;

  GetFollowedSources(this.repository);

  Stream<List<FollowedSourceData>> call() {
    return repository.getFollowedSources();
  }
}

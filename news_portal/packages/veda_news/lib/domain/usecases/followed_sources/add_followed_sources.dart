import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/domain/repositories/drift_followed_sources_repository.dart';

class AddFollowedSources {
  final DriftFollowedSourcesRepository repository;

  AddFollowedSources(this.repository);
  Future<int> call(FollowedSourceCompanion source) async {
    return await repository.addFollowedSource(source);
  }
}

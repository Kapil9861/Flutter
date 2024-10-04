import 'package:veda_news/domain/repositories/drift_followed_sources_repository.dart';

class RemoveFollowedSource {
  final DriftFollowedSourcesRepository repository;

  RemoveFollowedSource(this.repository);

  Future<int> call(int id) async {
    return await repository.removeFollowedSource(id);
  }
}

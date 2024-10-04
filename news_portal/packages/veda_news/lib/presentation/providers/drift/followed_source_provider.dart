import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/data/datasource/drift/followed_source_datasource.dart';
import 'package:veda_news/data/repositories/drift_followed_sources_repository_impl.dart';
import 'package:veda_news/domain/repositories/drift_followed_sources_repository.dart';

final followedSourceProvider = Provider<FollowedSourceDatasource>((ref) {
  return FollowedSourceDatasource();
});

final followedRepositoryProvider =
    Provider<DriftFollowedSourcesRepository>((ref) {
  final repo = ref.watch(followedSourceProvider);
  return DriftFollowedSourcesRepositoryImpl(repo);
});

final getFollowedSourcesProvider = StreamProvider((ref) {});

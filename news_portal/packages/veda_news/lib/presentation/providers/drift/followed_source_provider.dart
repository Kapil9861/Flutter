import 'package:components/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/data/datasource/drift/followed_source_datasource.dart';
import 'package:veda_news/data/repositories/drift_followed_sources_repository_impl.dart';
import 'package:veda_news/domain/repositories/drift_followed_sources_repository.dart';
import 'package:veda_news/domain/usecases/followed_sources/add_followed_sources.dart';
import 'package:veda_news/domain/usecases/followed_sources/get_followed_sources.dart';
import 'package:veda_news/domain/usecases/followed_sources/remove_followed_source.dart';

final followedSourceProvider = Provider<FollowedSourceDatasource>((ref) {
  return FollowedSourceDatasource();
});

final followedRepositoryProvider =
    Provider<DriftFollowedSourcesRepository>((ref) {
  final repo = ref.watch(followedSourceProvider);
  return DriftFollowedSourcesRepositoryImpl(repo);
});

final getFollowedSourcesProvider = StreamProvider((ref) {
  final repo = ref.watch(followedRepositoryProvider);
  final useCase = GetFollowedSources(repo);
  return useCase.call();
});

final addFollowedSourceProvider =
    StateNotifierProvider<AddFollowedSourceNotifier, String>((ref) {
  final repo = ref.watch(followedRepositoryProvider);
  final useCase = AddFollowedSources(repo);
  return AddFollowedSourceNotifier(useCase);
});

final removeFollowedSourceProvider =
    ChangeNotifierProvider<RemoveFollowedSourceNotifier>((ref) {
  final repo = ref.watch(followedRepositoryProvider);
  final useCase = RemoveFollowedSource(repo);
  return RemoveFollowedSourceNotifier(useCase);
});

class RemoveFollowedSourceNotifier extends ChangeNotifier {
  final RemoveFollowedSource useCase;

  RemoveFollowedSourceNotifier(this.useCase);
  String message = "";

  Future<void> remove(BuildContext context, int id) async {
    final result = await useCase.call(id);
    if (result > 0) {
      message = "Removed Followed Source Successfully!";
      CustomSnackbar().show(context, message);
    } else {
      message = "Could Not Delete Followed Source!";
      CustomSnackbar().show(context, message);
    }
    notifyListeners();
  }
}

class AddFollowedSourceNotifier extends StateNotifier<String> {
  final AddFollowedSources useCase;

  AddFollowedSourceNotifier(this.useCase) : super("");

  Future<void> add(BuildContext context, FollowedSourceCompanion source) async {
    String message = "Could not update!";
    final result = await useCase.call(source);
    if (result > 0) {
      message = "Followed Successfully!";
      CustomSnackbar().show(context, message);
    } else if (result == 0) {
      message = "Could not update!";
      CustomSnackbar().show(context, message);
    } else {
      message = "Something went wrong! Could not follow.";
      CustomSnackbar().show(context, message);
    }
    state = message;
  }
}

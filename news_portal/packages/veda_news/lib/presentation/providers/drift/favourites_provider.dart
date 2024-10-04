import 'package:components/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/data/datasource/drift/favourites_datasource.dart';
import 'package:veda_news/data/repositories/drift_favourite_artciles_repository_impl.dart';
import 'package:veda_news/domain/repositories/drift_favourite_articles_repository.dart';
import 'package:veda_news/domain/usecases/favourites/add_favourite_article.dart';
import 'package:veda_news/domain/usecases/favourites/get_favourite_articles.dart';
import 'package:veda_news/domain/usecases/favourites/remove_favourite_article.dart';

final favouritesDatasourceProvider = Provider<FavouritesDatasource>((ref) {
  return FavouritesDatasource();
});

final favouritesRepositoryProvider =
    Provider<DriftFavouriteArticlesRepository>((ref) {
  final source = ref.watch(favouritesDatasourceProvider);
  return DriftFavouriteArtcilesRepositoryImpl(source);
});

final getFavouritesProvider = StreamProvider((ref) {
  final repo = ref.watch(favouritesRepositoryProvider);
  final useCase = GetFavouriteArticles(repo);
  return useCase.call();
});

final addFavouriteArticleProvider =
    StateNotifierProvider<AddFavouriteArticleNotifier, String>((ref) {
  final repo = ref.watch(favouritesRepositoryProvider);
  final useCase = AddFavouriteArticle(repo);
  return AddFavouriteArticleNotifier(useCase);
});

final removeFavouriteArticleProvider = ChangeNotifierProvider((ref) {
  final repo = ref.watch(favouritesRepositoryProvider);
  final useCase = RemoveFavouriteArticle(repo);
  return RemoveFavouriteArticleProvider(useCase);
});

class RemoveFavouriteArticleProvider extends ChangeNotifier {
  final RemoveFavouriteArticle useCase;

  RemoveFavouriteArticleProvider(this.useCase);
  String message = "";

  Future<void> remove(BuildContext context, int id) async {
    final result = await useCase.call(id);
    if (result > 0) {
      message = "Article is not favourite anymore!";
      CustomSnackbar().show(context, message);
    } else {
      message = "Could not delete article!";
      CustomSnackbar().show(context, message);
    }
    notifyListeners();
  }
}

class AddFavouriteArticleNotifier extends StateNotifier<String> {
  final AddFavouriteArticle useCase;

  AddFavouriteArticleNotifier(this.useCase) : super('');

  Future<void> add(BuildContext context, FavouritesCompanion favourite) async {
    String message;
    final result = await useCase.call(favourite);
    if (result > 0) {
      message = "Added as Favourite Article!";
      CustomSnackbar().show(context, message);
    } else if (result == 0) {
      message = "Could not add as favourite!";
      CustomSnackbar().show(context, message);
    } else {
      message = "Something went wrong! Couldn't Mark Favourite!";
      CustomSnackbar().show(context, message);
    }

    state = message;
  }
}

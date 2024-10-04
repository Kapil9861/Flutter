import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/domain/repositories/drift_favourite_articles_repository.dart';

class AddFavouriteArticle {
  final DriftFavouriteArticlesRepository repository;

  AddFavouriteArticle(this.repository);

  Future<int> call(FavouritesCompanion favourite) async {
    return await repository.addFavouriteArticle(favourite);
  }
}

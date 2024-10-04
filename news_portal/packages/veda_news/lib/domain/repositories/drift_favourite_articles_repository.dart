import 'package:veda_news/data/database/news_portal_database.dart';

abstract class DriftFavouriteArticlesRepository {
  Stream<List<Favourite>> getFavouriteArticles();
  Future<int> removeFavouriteArticle(int id);
  Future<int> addFavouriteArticle(FavouritesCompanion favourite);
}

import 'package:veda_news/data/database/news_portal_database.dart';

class FavouritesDatasource {
  final _database = NewsPortalDatabase();
  Stream<List<Favourite>> getFavouriteArticles() {
    return _database.getFavouriteArticle();
  }

  Future<int> removeFavouriteArticle(int id) async {
    return await _database.removeFavouriteArticle(id);
  }

  Future<int> addFavouriteArticle(FavouritesCompanion favourite) async {
    return await _database.addFavouriteArticle(favourite);
  }
}

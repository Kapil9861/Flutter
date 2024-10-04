import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/data/datasource/drift/favourites_datasource.dart';
import 'package:veda_news/domain/repositories/drift_favourite_articles_repository.dart';

class DriftFavouriteArtcilesRepositoryImpl
    implements DriftFavouriteArticlesRepository {
  final FavouritesDatasource source;

  DriftFavouriteArtcilesRepositoryImpl(this.source);
  @override
  Future<int> addFavouriteArticle(FavouritesCompanion favourite) async {
    return await source.addFavouriteArticle(favourite);
  }

  @override
  Stream<List<Favourite>> getFavouriteArticles() {
    return source.getFavouriteArticles();
  }

  @override
  Future<int> removeFavouriteArticle(int id) async {
    return await source.removeFavouriteArticle(id);
  }
}

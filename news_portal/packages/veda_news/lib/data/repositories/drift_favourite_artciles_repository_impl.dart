import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/data/datasource/drift/favourites_datasource.dart';
import 'package:veda_news/domain/repositories/drift_favourite_articles_repository.dart';

class DriftFavouriteArtcilesRepositoryImpl
    implements DriftFavouriteArticlesRepository {
  final FavouritesDatasource source;

  DriftFavouriteArtcilesRepositoryImpl(this.source);
  @override
  Future<int> addFavouriteArticle(FavouritesCompanion favourite) {
    // TODO: implement addFavouriteArticle
    throw UnimplementedError();
  }

  @override
  Stream<List<Favourite>> getFavouriteArticles() {
    // TODO: implement getFavouriteArticles
    throw UnimplementedError();
  }

  @override
  Future<int> removeFavouriteArticle(int id) {
    // TODO: implement removeFavouriteArticle
    throw UnimplementedError();
  }
}

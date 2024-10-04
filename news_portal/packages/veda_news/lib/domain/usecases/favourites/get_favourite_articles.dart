import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/domain/repositories/drift_favourite_articles_repository.dart';

class GetFavouriteArticles {
  final DriftFavouriteArticlesRepository repository;

  GetFavouriteArticles(this.repository);
  Stream<List<Favourite>> call() {
    return repository.getFavouriteArticles();
  }
}

import 'package:veda_news/data/database/news_portal_database.dart';
import 'package:veda_news/data/repositories/drift_favourite_artciles_repository_impl.dart';

class GetFavouriteSource {
  final DriftFavouriteArtcilesRepositoryImpl repository;

  GetFavouriteSource(this.repository);
  Stream<List<Favourite>> call() {
    return repository.getFavouriteArticles();
  }
}

import 'package:veda_news/domain/repositories/drift_favourite_articles_repository.dart';

class RemoveFavouriteArticle {
  final DriftFavouriteArticlesRepository repository;

  RemoveFavouriteArticle(this.repository);
  Future<int> call(int id) async {
    return await repository.removeFavouriteArticle(id);
  }
}

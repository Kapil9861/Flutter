import 'package:veda_news/domain/repositories/news_repository.dart';

class FetchNewsArticle {
  final NewsRepository repository;

  FetchNewsArticle(this.repository);

  Future<Map<String, dynamic>> call(
      {String? category, String? sortBy, String? source}) async {
    return await repository.fetchNewsFromApi(
      category: category,
      sortBy: sortBy,
      source: source,
    );
  }
}

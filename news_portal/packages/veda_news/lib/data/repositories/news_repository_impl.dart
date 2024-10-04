import 'package:veda_news/data/datasource/news_article_datasource.dart';
import 'package:veda_news/domain/repositories/news_repository.dart';

/// The [NewsRepository] class is responsible for fetching news data from an external API.
/// It provides methods to retrieve news articles based on various filters such as category
/// and sorting order.
class NewsRepositoryImpl implements NewsRepository {
  final NewsArticleDatasource datasource;

  NewsRepositoryImpl(this.datasource);

  @override
  Future<Map<String, dynamic>> fetchNewsFromApi({
    String? sortBy,
    String? category,
    String? source,
  }) async {
    return await datasource.fetchNews(
      category: category,
      sortBy: sortBy,
      sources: source,
    );
  }
}

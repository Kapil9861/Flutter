import 'package:veda_news/data/datasource/news_article_datasource.dart';
import 'package:veda_news/domain/repositories/news_repository.dart';

/// The [NewsRepository] class is responsible for fetching news data from an external API.
/// It provides methods to retrieve news articles based on various filters such as category
/// and sorting order.
class NewsRepositoryImpl implements NewsRepository {
  final NewsArticleDatasource source;

  NewsRepositoryImpl(this.source);

  @override
  Future<Map<String, dynamic>> fetchNewsFromApi({
    String? sortBy,
    String? category,
  }) async {
    return await source.fetchNews();
  }
}

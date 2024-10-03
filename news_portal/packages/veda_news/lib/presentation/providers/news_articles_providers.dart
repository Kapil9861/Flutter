import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/data/datasource/news_article_datasource.dart';
import 'package:veda_news/data/models/news_model.dart';
import 'package:veda_news/data/repositories/news_repository_impl.dart';
import 'package:veda_news/domain/repositories/news_repository.dart';
import 'package:veda_news/domain/usecases/fetch_news_article.dart';

final newsDataSourceProvider = Provider<NewsArticleDatasource>((ref) {
  final httpService = HttpServiceImpl();
  return NewsArticleDatasource(httpService);
});

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final source = ref.watch(newsDataSourceProvider);
  return NewsRepositoryImpl(source);
});

final newsArticlesProvider =
    ChangeNotifierProvider<NewsArticlesNotifier>((ref) {
  final repo = ref.watch(newsRepositoryProvider);
  final fetchNews = FetchNewsArticle(repo);
  return NewsArticlesNotifier(fetchNews);
});

class NewsArticlesNotifier extends ChangeNotifier {
  final FetchNewsArticle fetchNews;

  NewsArticlesNotifier(this.fetchNews);
  NewsModel newsModel = NewsModel(
    articles: [],
    status: "initial-state",
    totalResults: 0,
  );

  Future<void> fetchNewsArticles(
    BuildContext context, {
    String? sortBy,
    String? category,
  }) async {
    final fetchNewsModel = await fetchNews.call(
      category: category,
      sortBy: sortBy,
    );
    final data = fetchNewsModel['data'];
    final error = fetchNewsModel['error'];
    if (data != null && error == null) {
      newsModel = NewsModel.fromJson(data);
    } else {
      if (context.mounted) {
        CustomSnackbar().show(context, error);
      }
    }
    notifyListeners();
  }
}

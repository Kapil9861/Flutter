import 'package:veda_news/models/articles.dart';

class NewsModel {
  final String? status;
  final int? totalResults;
  final List<Articles>? articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsModel.fromJson(Map<String, dynamic> json)
      : this(
          status: json['status'],
          totalResults: json['totalResults'],
          articles: json['articles'],
        );

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles,
    };
  }
}

import 'package:veda_news/data/models/articles.dart';

/// A class representing a news response.
///
/// The `NewsModel` class encapsulates the response structure for news data,
/// including the status of the request, the total number of results, and
/// a list of articles.

class NewsModel {
  /// The status of the news response.
  final String? status;

  /// The total number of results available.
  final int? totalResults;

  /// A list of articles included in the news response.
  final List<Articles>? articles;

  /// Creates a [NewsModel] instance with the given [status], [totalResults], and [articles].
  ///
  /// All fields are optional and can be `null`.
  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  /// Creates a [NewsModel] instance from a JSON map.
  ///
  /// The [json] map should contain the `status`, `totalResults`, and `articles` fields.
  /// The `articles` field is expected to be a list of article objects.
  NewsModel.fromJson(Map<String, dynamic> json)
      : this(
          status: json['status'],
          totalResults: json['totalResults'],
          articles: (json['articles'] as List<dynamic>?)
              ?.map((article) =>
                  Articles.fromJson(article as Map<String, dynamic>))
              .toList(),
        );

  /// Converts the [NewsModel] instance to a JSON map.
  ///
  /// The resulting map contains the `status`, `totalResults`, and `articles` fields.
  /// The `articles` field will be converted to a list of JSON objects.
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles
          ?.map(
            (article) => article.toJson(),
          )
          .toList(),
    };
  }
}

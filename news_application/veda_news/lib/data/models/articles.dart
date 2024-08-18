import 'package:veda_news/data/models/source.dart';

/// A class representing an individual article.
///
/// The `Articles` class encapsulates the details of a news article, including
/// its source, author, title, description, URL, image URL, publication date,
/// and content.

class Articles {
  /// The source of the article.
  final Source? source;

  /// The author of the article.
  final String? author;

  /// The title of the article.
  final String? title;

  /// A brief description of the article.
  final String? description;

  /// The URL of the article.
  final String? url;

  /// The URL to the article's image.
  final String? urlToImage;

  /// The publication date of the article.
  final String? publishedAt;

  /// The content of the article.
  final String? content;

  /// Creates an [Articles] instance with the given [source], [author], [title],
  /// [description], [url], [urlToImage], [publishedAt], and [content].
  ///
  /// All fields are optional and can be `null`.
  Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  /// Creates an [Articles] instance from a JSON map.
  ///
  /// The [json] map should contain the `source`, `author`, `title`, `description`,
  /// `url`, `urlToImage`, `publishedAt`, and `content` fields.
  /// If the `source` field is present, it will be parsed into a [Source] object.
  Articles.fromJson(Map<String, dynamic> json)
      : source = json['source'] != null ? Source.fromJson(json['source']) : null,
        author = json['author'],
        title = json['title'],
        description = json['description'],
        url = json['url'],
        urlToImage = json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'];

  /// Converts the [Articles] instance to a JSON map.
  ///
  /// The resulting map contains the `source`, `author`, `title`, `description`,
  /// `url`, `urlToImage`, `publishedAt`, and `content` fields.
  /// If the `source` is not `null`, it will be converted to a JSON object.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

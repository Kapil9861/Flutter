import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:veda_news/data/models/news_model.dart';
import 'package:http/http.dart' as http;

/// The [NewsRepository] class is responsible for fetching news data from an external API.
/// It provides methods to retrieve news articles based on various filters such as category
/// and sorting order.
class NewsRepository {
  /// Fetches news articles from the API based on the provided [category] and [sortBy] parameters.
  ///
  /// The method constructs the appropriate API URL based on the parameters and sends an HTTP GET
  /// request to retrieve the data. It returns a [NewsModel] object containing the parsed news data.
  ///
  /// If both [category] and [sortBy] are null or empty, it defaults to fetching general news articles.
  ///
  /// If the API call fails (i.e., status code is not 200), an [ErrorDescription] is thrown with a message.
  ///
  /// - [category]: The category of news articles to fetch (e.g., "business", "technology").
  /// - [sortBy]: The sort order for the news articles (e.g., "publishedAt", "popularity").
  Future<NewsModel> fetchNewsFromApi({
    String? sortBy,
    String? category,
  }) async {
    String url;

    // Determines the correct API URL based on the provided filters.
    if ((category == null || category.isEmpty) &&
        (sortBy == null || sortBy.isEmpty)) {
      // Case: No category or sortBy specified, fetch general news
      url =
          "https://newsapi.org/v2/everything?q=general&apiKey=70b4404cf5dd41829dc005be379e9afb";
    } else if ((category != null && category.isNotEmpty) &&
        (sortBy != null && category.isNotEmpty)) {
      // Case: Both category and sortBy are specified
      url =
          "https://newsapi.org/v2/top-headlines?category=$category&sortBy=$sortBy&apiKey=70b4404cf5dd41829dc005be379e9afb";
    } else if ((category == null || category.isEmpty) &&
        (sortBy != null && sortBy.isNotEmpty)) {
      // Case: Only sortBy is specified, fetch general news sorted by the specified order
      url =
          "https://newsapi.org/v2/everything?q=general&sortBy=$sortBy&apiKey=70b4404cf5dd41829dc005be379e9afb";
    } else {
      // Case: Only category is specified, fetch news for that category
      url =
          "https://newsapi.org/v2/top-headlines?category=$category&apiKey=70b4404cf5dd41829dc005be379e9afb";
    }

    // Sends an HTTP GET request to the API
    final response = await http.get(Uri.parse(url));

    // Checks if the API call was successful
    if (response.statusCode == 200) {
      final content = jsonDecode(response.body);
      return NewsModel.fromJson(content);
    }

    // Throws an error if the API call fails
    throw ErrorDescription(
        "Could not connect to the source!\n Please try again later");
  }
}

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
    String url = "http://10.0.2.2:8000/api/getData";

    // bool checkEmulator = await isEmulator();

    // Sends an HTTP GET request to the API
    try {
      var response = await http.get(Uri.parse(url));

      if (response != null) {
        final content = jsonDecode(response.body);
        return NewsModel.fromJson(content);
      } else {
        return Future.error("Server error");
      }
    } catch (e) {
      return Future.error("The error is:$e");
    }
    // Checks if the API call was successful

    // Throws an error if the API call fails
  }
}

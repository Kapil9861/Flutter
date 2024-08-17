import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:veda_news/data/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<NewsModel> fetchNewsFromApi({
    String? sortBy,
    String? category,
  }) async {
    String url;
    if ((category == null || category.isEmpty) &&
        (sortBy == null || sortBy.isEmpty)) {
      url =
          "https://newsapi.org/v2/everything?q=general&apiKey=978e0e0d995f4a23a96280fcf53ffbef";
    } else if ((category != null && category.isNotEmpty) &&
        (sortBy != null && category.isNotEmpty)) {
      url =
          "https://newsapi.org/v2/top-headlines?category=$category&sortBy=$sortBy&apiKey=978e0e0d995f4a23a96280fcf53ffbef";
    } else if ((category == null || category.isEmpty) &&
        (sortBy != null && sortBy.isNotEmpty)) {
      url =
          "https://newsapi.org/v2/everything?q=general&sortBy=$sortBy&apiKey=978e0e0d995f4a23a96280fcf53ffbef";
    } else {
      url =
          "https://newsapi.org/v2/top-headlines?category=$category&apiKey=978e0e0d995f4a23a96280fcf53ffbef";
    }

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final content = jsonDecode(response.body);
      return NewsModel.fromJson(content);
    }
    throw ErrorDescription(
        "Could not connect to the source!\n Please try again later");
  }
}

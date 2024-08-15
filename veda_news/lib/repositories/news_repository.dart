import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:veda_news/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<NewsModel> fetchNewsFromApi() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=978e0e0d995f4a23a96280fcf53ffbef";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final content = jsonDecode(response.body);
      return NewsModel.fromJson(content);
    }
    throw ErrorDescription(
        "Could not connect to the source!\n Please try again later");
  }
}

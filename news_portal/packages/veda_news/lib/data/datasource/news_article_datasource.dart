import 'package:core/core.dart';

class NewsArticleDatasource {
  final HttpService httpService;

  NewsArticleDatasource(this.httpService);
  Future<Map<String, dynamic>> fetchNews({
    String? sortBy,
    String? category,
  }) async {
    String endPoint;
    Map<String, dynamic> queryParameters = {};

    // Determines the correct API URL based on the provided filters.
    if ((category == "all" || category == null || category.isEmpty) &&
        (sortBy == null || sortBy.isEmpty)) {
      // Case: No category or sortBy specified, fetch general news
      endPoint = "everything";
      queryParameters['q'] = "general";
      queryParameters["apiKey"] = apiKey;
    } else if ((category != null && category.isNotEmpty) &&
        (sortBy != null && category.isNotEmpty)) {
      // Case: Both category and sortBy are specified
      endPoint = "top-headlines";
      queryParameters['category'] = category;
      queryParameters['sortBy'] = sortBy;
      queryParameters["apiKey"] = apiKey;
    } else if ((category == null || category.isEmpty) &&
        (sortBy != null && sortBy.isNotEmpty)) {
      // Case: Only sortBy is specified, fetch general news sorted by the specified order
      endPoint = "everything";
      queryParameters['q'] = "general";
      queryParameters['sortBy'] = sortBy;
      queryParameters["apiKey"] = apiKey;
    } else {
      // Case: Only category is specified, fetch news for that category
      endPoint = "top-headlines";
      queryParameters['category'] = category;
      queryParameters['apiKey'] = apiKey;
    }

    return await httpService.get(endPoint, queryParameters);
  }
}

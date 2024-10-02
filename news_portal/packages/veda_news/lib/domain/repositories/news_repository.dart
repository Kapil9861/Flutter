abstract class NewsRepository {
  Future<Map<String, dynamic>> fetchNewsFromApi({
    String? sortBy,
    String? category,
  });
}

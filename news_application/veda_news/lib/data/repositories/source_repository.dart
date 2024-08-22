import "dart:convert";

import "package:http/http.dart" as http;
import "package:veda_news/data/models/source.dart";

class SourceRepository {
  Future<Source> fetchSourceFromApi() async {
    try {
      var response =
          await http.get(Uri.parse("http://10.0.2.2:8000/api/getCompanies"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Source.fromJson(data);
      } else {
        return Future.error("Server Error: ${response.statusCode}");
      }
    } catch (e) {
      return Future.error("The error is:$e");
    }
  }
}

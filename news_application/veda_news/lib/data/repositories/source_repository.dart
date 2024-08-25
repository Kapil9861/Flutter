import 'dart:convert';

import 'package:veda_news/data/models/source.dart';
import 'package:http/http.dart' as http;

class SourceRepository {
  Future<List<Source>> fetchSourceFromApi() async {
    try {
      var response =
          await http.get(Uri.parse("http://10.0.2.2:8000/api/getCompanies"));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data
            .map((json) => Source.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        return Future.error("Server Error: ${response.statusCode}");
      }
    } catch (e) {
      return Future.error("The error is: $e");
    }
  }

  Future<String> addSource(Source source) async {
    try {
      var response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/addCompany"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': source.name,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['success'];
      } else if (response.statusCode == 409) {
        final data = jsonDecode(response.body);
        return data['error'];
      } else {
        return "Server Error: ${response.statusCode} - ${response.body}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:veda_news/data/models/user_model.dart';

class UserRepository {
  Future<String> register(User user) async {
    try {
      var response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/addUser"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': user.name,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return data['success'];
      } else if (response.statusCode == 400) {
        final data = jsonDecode(response.body);
        return data['message'];
      } else if (response.statusCode == 302) {
        // Handle the redirection, perhaps by following the redirect or informing the user
        return 'Redirection detected. Please check the server configuration.';
      } else {
        return "Server Error: ${response.statusCode} - ${response.body}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}

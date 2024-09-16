import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:veda_news/data/models/user_model.dart';

class UserDatasource {
  Future<String> register(User user, String deviceName) async {
    try {
      var response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/addUser"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': user.name,
          'email': user.email,
          'password': user.password,
          'source_id': user.sourceId,
          'email_verified_at': user.emailVerifiedAt?.toIso8601String(),
          'device_name': deviceName,
          'phone': user.phoneNumber,
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

  Future<String> login(String email, String password, String deviceName) async {
    try {
      var response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'device_name': deviceName,
        }),
      );
      print(response.body);
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

  Future<String> logout(String token) async {
    var response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/logout"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'token': token,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['success'];
    } else if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      print(data);
      return data['success'];
    } else if (response.statusCode == 400) {
      final data = jsonDecode(response.body);

      return data['success'];
    } else if (response.statusCode == 302) {
      // Handle the redirection, perhaps by following the redirect or informing the user
      return 'Redirection detected. Please check the server configuration.';
    } else {
      print("Server Error: ${response.statusCode} - ${response.body}");
      return "Server Error: ${response.statusCode} - ${response.body}";
    }
  }
}

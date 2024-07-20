import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:out_rate/api/api_key.dart';

class SignInService {
  Future<Map<String, dynamic>> signIn(String username, String password) async {
    final url = Uri.parse(signinUrl);
    final payload = {
      "username": username,
      "password": password,
    };

    try {
      final response = await http.post(
        url,
        body: payload,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        final errorData = json.decode(response.body);
        throw Exception(errorData['message']);
      }
    } catch (e) {
      throw Exception('Failed to sign in. Please try again.');
    }
  }
}

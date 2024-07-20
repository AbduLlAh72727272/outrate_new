import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/feed_model.dart';

class HomeService {
  Future<List<FeedModel>> fetchProfiles(String token, int userId) async {
    final url = 'https://outrate-apis.vercel.app/api/v2/Post/GetFeed/$userId';
    final headers = {
      'Authorization': '$token',
    };

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == true) {
          return (jsonResponse['posts'] as List)
              .map((data) => FeedModel.fromJson(data))
              .toList();
        } else {
          throw Exception(jsonResponse['message']);
        }
      } else {
        throw Exception('Failed to fetch profiles: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch profiles: $e');
    }
  }
}

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/feed_model.dart';

class HomeController extends GetxController {
  var profiles = <FeedModel>[].obs;
  var isLoading = true.obs;
  late String token;
  late int userId;

  void initialize(String token, int userId) {
    this.token = token;
    this.userId = userId;
    fetchProfiles();
  }

  Future<void> fetchProfiles() async {
    isLoading.value = true;

    final url = 'https://outrate-apis.vercel.app/api/v2/Post/GetFeed/$userId';
    final headers = {
      'Authorization': '$token',
    };

    print('Request URL: $url');
    print('Request URL: $token');

    print('Request Headers: $headers');

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print('Response Body: ${response.body}');
    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == true) {
        profiles.value = (jsonResponse['posts'] as List)
            .map((data) => FeedModel.fromJson(data))
            .toList();
      } else {
        Get.snackbar('Error', jsonResponse['message']);
      }
    } else {
      Get.snackbar('Error', 'Failed to fetch profiles: ${response.statusCode}');
    }

    isLoading.value = false;
  }
}
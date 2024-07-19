import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:out_rate/controllers/user_controller.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;
  var searchResults = [].obs;
  var recentUsers = [].obs;
  var searchController = TextEditingController();
  late String token;

  final UserController userController = Get.find();

  Future<void> searchUsers(String query) async {
    if (query.isEmpty) return;

    isLoading.value = true;
    final url =
        Uri.parse('https://outrate-apis.vercel.app/api/v2/User/SearchUsers');

    try {
      var request = http.MultipartRequest('GET', url);
      request.headers['Authorization'] = userController.token.value;

      request.fields['query'] = query;

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final data = json.decode(responseData.body);
        searchResults.value = data['results'];
      } else {
        final responseData = await http.Response.fromStream(response);
        final errorData = json.decode(responseData.body);
        Get.snackbar('Error', errorData['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to search users. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchRecentUsers() async {
    isLoading.value = true;
    final url =
        Uri.parse('https://outrate-apis.vercel.app/api/v2/User/GetUserByID');

    try {
      var request = http.MultipartRequest('GET', url);
      request.headers['Authorization'] = userController.token.value;

      // Add required fields if any (e.g., user ID)
      // request.fields['id'] = 'some_user_id';

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final data = json.decode(responseData.body);
        recentUsers.value =
            data['results']; // Assuming 'results' key holds the user data
      } else {
        final responseData = await http.Response.fromStream(response);
        final errorData = json.decode(responseData.body);
        Get.snackbar('Error', errorData['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch recent users. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }
}

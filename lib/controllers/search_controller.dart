// controllers/search_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../services/api_service.dart';
import '../models/user_model.dart';
import '../services/search_service.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;
  var searchResults = <UserModel>[].obs;
  var recentUsers = <UserModel>[].obs;
  var searchController = TextEditingController();
  late String token;

  final ApiService apiService = Get.find();

  Future<void> searchUsers(String query) async {
    if (query.isEmpty) return;

    isLoading.value = true;

    try {
      final users = await apiService.searchUsers(token, query);
      searchResults.value = users;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchRecentUsers(List<int> userIds) async {
    isLoading.value = true;

    try {
      List<UserModel> users = [];
      for (int userId in userIds) {
        final user = await apiService.fetchUserById(token, userId);
        users.add(user);
      }
      recentUsers.value = users;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

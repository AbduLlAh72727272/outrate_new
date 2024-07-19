import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:out_rate/api/api_key.dart';
import 'package:out_rate/controllers/user_controller.dart';
import 'dart:convert';
//import '../view/bottom_navigation.dart';
import '../widgets/bottom_nav_bar.dart'; // Import BottomNavigation

class SignInController extends GetxController {
  var isLoading = false.obs;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> signIn() async {
    isLoading.value = true;
    final url = Uri.parse(signinUrl);
    final payload = {
      "username": usernameController.text,
      "password": passwordController.text,
    };

    try {
      final response = await http.post(
        url,
        body: payload,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = 'Bearer ${data['user']['token']}';
        final UserController userController =
            Get.put(UserController(), permanent: true);
        userController.token.value = data['user']['token'];
        // Ensure token is not null
        final userId = data['user']['id'] ?? 0; // Ensure userId is not null
        // Handle successful sign-in
        Get.snackbar('Success', 'Signed in successfully');
        Get.off(() => BottomNavigation(
              token: token,
              userId: userId,
            )); // Navigate to BottomNavigation with token and userId
      } else {
        final errorData = json.decode(response.body);
        Get.snackbar('Error', errorData['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }
}

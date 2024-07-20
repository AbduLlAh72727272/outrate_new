import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:out_rate/services/sign_in_service.dart';
import '../widgets/bottom_nav_bar.dart'; // Import BottomNavigation
import 'package:out_rate/controllers/user_controller.dart';

class SignInController extends GetxController {
  var isLoading = false.obs;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  final SignInService _signInService = SignInService(); // Create an instance of SignInService

  Future<void> signIn() async {
    isLoading.value = true;
    final username = usernameController.text;
    final password = passwordController.text;

    try {
      final data = await _signInService.signIn(username, password);
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
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

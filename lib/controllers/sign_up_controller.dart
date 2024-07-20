import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:out_rate/services/sign_up_service.dart'; // Import SignUpService
import 'package:out_rate/controllers/user_controller.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var fullNameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var bioController = TextEditingController();
  var countryController = TextEditingController();
  File? profilePic;
  final SignUpService _signUpService = SignUpService(); // Create an instance of SignUpService

  Future<void> signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    isLoading.value = true;

    try {
      final data = await _signUpService.signUp(
        username: usernameController.text,
        email: emailController.text,
        fullName: fullNameController.text,
        password: passwordController.text,
        bio: bioController.text,
        country: countryController.text,
        profilePic: profilePic,
      );
      final UserController userController =
      Get.put(UserController(), permanent: true);
      userController.token.value = data['user']['token'];
      // Handle successful sign-up
      Get.snackbar('Success', 'Signed up successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

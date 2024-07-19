// controllers/edit_profile_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import '../models/user_model.dart';
import '../models/user_model.dart';
//import '../view/user_model.dart';
import 'user_controller.dart';

class EditProfileController extends GetxController {
  final userController = Get.find<UserController>();

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final bioController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final user = userController.user.value;
    if (user != null) {
      nameController.text = user.name;
      usernameController.text = user.username;
      bioController.text = user.bio;
    }
  }

  Future<void> editProfile() async {
    isLoading.value = true;

    final user = userController.user.value;
    if (user == null) return;

    final url = 'https://outrate-apis.vercel.app/api/v2/User/EditProfile';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userController.token.value}',
      },
      body: json.encode({
        'id': user.id,
        'name': nameController.text,
        'username': usernameController.text,
        'bio': bioController.text,
      }),
    );

    if (response.statusCode == 200) {
      final updatedUser = UserModel(
        id: user.id,
        name: nameController.text,
        username: usernameController.text,
        bio: bioController.text,
      );
      userController.updateUser(updatedUser);
      Get.snackbar('Success', 'Profile updated successfully');
    } else {
      Get.snackbar('Error', 'Failed to update profile');
    }

    isLoading.value = false;
  }
}

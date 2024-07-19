import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProfileController extends GetxController {
  var isLoading = false.obs;
  var nameController = TextEditingController();
  var usernameController = TextEditingController();
  var bioController = TextEditingController();
  var passwordController = TextEditingController();
  File? profilePic;

  Future<void> editProfile() async {
    isLoading.value = true;
    final url = Uri.parse('https://outrate-apis.vercel.app/v2/User/EditProfile');
    final request = http.MultipartRequest('PUT', url);

    request.fields['name'] = nameController.text;
    request.fields['username'] = usernameController.text;
    request.fields['bio'] = bioController.text;
    request.fields['password'] = passwordController.text;

    if (profilePic != null) {
      request.files.add(
        await http.MultipartFile.fromPath('profilePic', profilePic!.path),
      );
    }

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final data = json.decode(responseData.body);
        // Handle successful profile update
        Get.snackbar('Success', 'Profile updated successfully');
      } else {
        final responseData = await http.Response.fromStream(response);
        final errorData = json.decode(responseData.body);
        Get.snackbar('Error', errorData['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }
}

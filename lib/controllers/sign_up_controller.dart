import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<void> signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    isLoading.value = true;
    final url =
        Uri.parse('https://outrate-apis.vercel.app/api/v2/Users/SignUp');
    final request = http.MultipartRequest('POST', url);

    request.fields['username'] = usernameController.text;
    request.fields['email'] = emailController.text;
    request.fields['fullName'] = fullNameController.text;
    request.fields['password'] = passwordController.text;
    request.fields['bio'] = bioController.text;
    request.fields['country'] = countryController.text;

    if (profilePic != null) {
      request.files.add(
        await http.MultipartFile.fromPath('profilePic', profilePic!.path),
      );
    }

    try {
      final response = await request.send();
      if (response.statusCode == 201) {
        final responseData = await http.Response.fromStream(response);
        final data = json.decode(responseData.body);
        final UserController userController =
            Get.put(UserController(), permanent: true);
        userController.token.value = data['user']['token'];
        // Handle successful sign-up
        Get.snackbar('Success', 'Signed up successfully');
      } else {
        final responseData = await http.Response.fromStream(response);
        final errorData = json.decode(responseData.body);
        Get.snackbar('Error', errorData['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign up. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }
}

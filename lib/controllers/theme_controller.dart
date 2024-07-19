
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../themes/light_theme.dart';
import '../themes/dark_theme.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  ThemeData get theme => isDarkMode.value ? darkTheme : lightTheme;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:out_rate/view/auth_screen.dart';
import 'controllers/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeController.theme,
        home: const AuthScreen(),
      );
    });
  }
}

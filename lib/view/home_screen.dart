import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:out_rate/themes/colors.dart';
import 'package:out_rate/view/message_list_screen.dart';
import '../controllers/home_controller.dart';
import '../widgets/custom_profile_card.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int) onItemSelected;
  final String token;
  final int userId;

  HomeScreen({
    required this.onItemSelected,
    required this.token,
    required this.userId,
  }) {
    final HomeController homeController = Get.put(HomeController());
    homeController.initialize(token, userId);
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        leadingWidth: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/splash_1.png',
              height: 26.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            Image.asset(
              'assets/images/splash_2.png',
              height: 18.0,
              fit: BoxFit.contain,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => MessagesListScreen());
            },
            icon: const Icon(
              Icons.toggle_off,
              color: darkBackgroundColor,
            ),
          ),
          IconButton(
            icon: Image.asset(
              'assets/icons/icon_search.png',
              height: 32.0,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              onItemSelected(1);
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (homeController.profiles.isEmpty) {
          return Center(child: Text('No profiles found'));
        }

        return ListView.builder(
          itemCount: homeController.profiles.length,
          itemBuilder: (context, index) {
            final profile = homeController.profiles[index];
            return CustomProfileCard(
              name: profile.name,
              username: profile.username,
              profileImageUrl: profile.profileImageUrl,
              imageUrls: profile.imageUrls,
              likeCount: profile.likeCount,
              commentCount: profile.commentCount, onActionPressed: () {
                // Handle action press
              },
            );
          },
        );
      }),
    );
  }
}
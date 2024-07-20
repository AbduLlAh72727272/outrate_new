import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:out_rate/themes/colors.dart';
import 'package:out_rate/view/message_list_screen.dart';
import '../controllers/home_controller.dart';
import '../widgets/custom_profile_card.dart';
import 'comment_screen_view.dart';

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
              commentCount: profile.commentCount,
              onActionPressed: () {
                // Handle action press
              },
              onCommentPressed: () {
                showCommentSection(context, token, userId);
              },
            );
          },
        );
      }),
    );
  }

  void showCommentSection(BuildContext context, String token, int userId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9, // Adjust to prevent full screen
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Color(0xFFEFEFF5), // Background color for the bottom sheet
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  Container(
                    height: 4.0,
                    width: 40.0,
                    color: Colors.grey[300],
                    margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  ),
                  Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 5, // Replace with your actual comment count
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/dummy_profile_2.png'), // Replace with your actual avatar image
                          ),
                          title: Row(
                            children: [
                              Text('The artist guy'),
                              SizedBox(width: 8.0),
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(Icons.star, color: Colors.yellow, size: 16);
                                }),
                              ),
                            ],
                          ),
                          subtitle: Text('Loved the outfit. everything is so on point'),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/dummy_profile_2.png'), // Replace with your actual avatar image
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Add a comment here',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          // Handle send comment
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

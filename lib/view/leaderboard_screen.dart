import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:out_rate/themes/colors.dart';
import '../controllers/leadership_controller.dart';
import '../models/leadership_model.dart';

class LeaderboardScreen extends StatelessWidget {
  final LeaderboardController leaderboardController = Get.put(LeaderboardController());

   LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            size: 16,
            Icons.arrow_back_ios_new,
            color: darkBackgroundColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
          title: const Text(
            'Leaderboard',
            style: TextStyle(color: darkBackgroundColor, fontSize: 19),
          ),
        ),
      body: Obx(() {
        if (leaderboardController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: leaderboardController.leaderboardList
                      .map((user) => _buildProfile(user))
                      .toList(),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _buildProfile(LeaderboardModel user) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage(user.imagePath),
              ),
            ),
            Positioned(
              bottom: -10,
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(4),
                child: Text(
                  '${user.rank}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: primaryColor, size: 16),
            SizedBox(width: 4),
            Text(
              user.rating,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

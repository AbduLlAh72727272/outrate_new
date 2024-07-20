import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:out_rate/themes/colors.dart';
import 'package:out_rate/view/leaderboard_screen.dart';
import 'package:out_rate/view/my_profile_screen.dart';
import 'package:out_rate/view/profile_screen.dart';
import 'package:out_rate/view/search_screen.dart';
import '../view/create_post_view.dart';
//import 'create_post_view.dart';  // Import the CreatePostView
import '../view/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  final String token;
  final int userId;

  const BottomNavigation({required this.token, required this.userId, Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(String assetName, int index, {bool? fromHomeScreen}) {
    bool isSelected = _selectedIndex == index;

    if (index == 0 && fromHomeScreen != null && fromHomeScreen) {
      if (_selectedIndex == 1) {
        isSelected = true;
      }
    }

    return Image.asset(
      assetName,
      height: 24,
      width: 24,
      color: isSelected ? Colors.black : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(
            onItemSelected: onItemTapped,
            token: widget.token,
            userId: widget.userId,
          ),
          SearchScreen(
            onItemSelected: onItemTapped,
            token: widget.token, recentUserIds: [],
          ),
          LeaderboardScreen(),
          Container(), // Placeholder for the middle button
          Container(
            child: Text('Messages'),
          ),
          MyProfileScreen(
            token: widget.token,
            userId: widget.userId,
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: _buildIcon('assets/icons/home_unselected.png', 0, fromHomeScreen: true),
                  onPressed: () => onItemTapped(0),
                ),
                IconButton(
                  icon: _buildIcon('assets/icons/podium_unselected.png', 2),
                  onPressed: () => onItemTapped(2),
                ),
                SizedBox(width: 48), // Space for the middle button
                IconButton(
                  icon: _buildIcon('assets/icons/message_unselected.png', 4),
                  onPressed: () => onItemTapped(4),
                ),
                IconButton(
                  icon: _buildIcon('assets/icons/profile_unselected.png', 5),
                  onPressed: () => onItemTapped(5),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: () {
                Get.to(() => CreatePostView());
              },
              backgroundColor: primaryColor,
              child: Image.asset(
                'assets/icons/add_icon.png',
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

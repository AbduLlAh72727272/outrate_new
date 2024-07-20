import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:out_rate/functions/alert_functions.dart';
import 'package:out_rate/themes/colors.dart';
import 'package:out_rate/view/edit_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
            'Settings',
            style: TextStyle(color: darkBackgroundColor, fontSize: 19),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                    child: Image.asset(
                      'assets/icons/icon_search.png',
                    ),
                  ),
                  suffixIconConstraints:
                  const BoxConstraints(maxHeight: 32, maxWidth: 32),
                  filled: true,
                  fillColor: Color(0xFF9797BD).withOpacity(0.15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Image.asset(
                  'assets/icons/notification_icon.png',
                  width: 24,
                  height: 24,
                ),
                title: const Text('Notifications'),
                onTap: () {
                  // Handle tap
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/icons/edit_profile_icon.png',
                  width: 24,
                  height: 24,
                ),
                title: const Text('Edit Profile'),
                onTap: () {
                  Get.to(() => EditProfileScreen());
                  // Handle tap
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/icons/blocked_users_icon.png',
                  width: 24,
                  height: 24,
                ),
                title: const Text('Blocked users'),
                onTap: () {
                  // Handle tap
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/icons/rating_icon.png',
                  width: 24,
                  height: 24,
                ),
                title: const Text('Rate Us'),
                onTap: () {
                  // Handle tap
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/icons/help_icon.png',
                  width: 24,
                  height: 24,
                ),
                title: const Text('Help'),
                onTap: () {
                  // Handle tap
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/icons/share2_icon.png',
                  width: 24,
                  height: 24,
                ),
                title: const Text('Share'),
                onTap: () {
                  // Handle tap
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/icons/delete_icon.png',
                  width: 24,
                  height: 24,
                ),
                title: const Text('Delete Account'),
                onTap: () {
                  showDeleteAccountDialog(context);
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/icons/logout_icon.png',
                  width: 24,
                  height: 24,
                ),
                title: const Text('Log Out'),
                onTap: () {
                  Get.back();
                  showLogoutDialog();
                  // Handle tap
                },
              ),
            ],
          ),
        ));
  }

  void showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Center(
            child: Text(
              "Are you sure you want to DELETE your account?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: <Widget>[
            SizedBox(
              width: 100,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xffFF6600),
                  side: const BorderSide(color: Color(0xffFF6600)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text(
                  "No",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xffFFFFFF),
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Add your delete account logic here
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text(
                  "Yes",
                  style: TextStyle(color: Color(0xffFF6600)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

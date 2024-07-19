// screens/edit_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:out_rate/themes/colors.dart';
import 'package:out_rate/view/change_password_screen.dart';
import '../controllers/edit_profile_controller.dart';
import '../controllers/user_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final EditProfileController editProfileController = Get.put(EditProfileController());

  EditProfileScreen({super.key});

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
          'Edit Profile',
          style: TextStyle(color: darkBackgroundColor, fontSize: 19),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/dummy_1.png'), // Replace with your image asset
            ),
            const SizedBox(height: 10),
            const Text(
              'Edit Profile Picture',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: editProfileController.nameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(18, 20, 12, 12),
                labelText: 'Name',
                labelStyle: GoogleFonts.roboto(color: greyColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color(0xFF262628).withOpacity(0.3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: editProfileController.usernameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(18, 20, 12, 12),
                labelText: 'User Name',
                labelStyle: GoogleFonts.roboto(color: greyColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color(0xFF262628).withOpacity(0.3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: editProfileController.bioController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(18, 20, 12, 12),
                labelText: 'Bio',
                labelStyle: GoogleFonts.roboto(color: greyColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color(0xFF262628).withOpacity(0.3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.to(() => ChangePasswordScreen());
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: editProfileController.passwordController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(18, 20, 12, 12),
                    hintText: 'Change Password',
                    hintStyle: GoogleFonts.roboto(color: greyColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color(0xFF262628).withOpacity(0.3),
                      ),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() {
                  return editProfileController.isLoading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.4,
                          MediaQuery.of(context).size.width * 0.1),
                    ),
                    onPressed: () {
                      editProfileController.editProfile();
                    },
                    child: Text('Save Changes',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  );
                }),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.4,
                        MediaQuery.of(context).size.width * 0.1),
                    elevation: 15,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.black.withOpacity(0.2),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.roboto(
                      color: darkBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

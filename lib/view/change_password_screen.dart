import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:out_rate/themes/colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

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

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 121,
              width: 121,
            ),
            const SizedBox(height: 10),
            const Text(
              'Change Password',
              style: TextStyle(
                color: darkBackgroundColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(18, 20, 12, 12),
                labelText: 'Old Password',
                labelStyle: GoogleFonts.roboto(color: greyColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color(
                      0xFF262628,
                    ).withOpacity(0.3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(18, 20, 12, 12),
                labelText: 'New Password',
                labelStyle: GoogleFonts.roboto(color: greyColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color(
                      0xFF262628,
                    ).withOpacity(0.3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(18, 20, 12, 12),
                labelText: 'Confirm Password',
                labelStyle: GoogleFonts.roboto(color: greyColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color(
                      0xFF262628,
                    ).withOpacity(0.3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // primary: primaryColor,
                    backgroundColor: primaryColor,
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.4,
                        MediaQuery.of(context).size.width * 0.1),
                  ),
                  onPressed: () {},
                  child: Text('Save Changes',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.4,
                        MediaQuery.of(context).size.width * 0.1),
                    elevation: 15,
                    foregroundColor: Colors.white,

                    // onPrimary: darkBackgroundColor,
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

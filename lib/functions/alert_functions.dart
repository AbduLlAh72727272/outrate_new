import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:out_rate/themes/colors.dart';

void showLogoutDialog() {
  Get.defaultDialog(
    title: '',
    backgroundColor: Colors.white.withOpacity(0.8),
    barrierDismissible: true,
    radius: 20,
    content: Container(
      width: 297,
      height: 200,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Are you sure you \n want to logout?',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // primary: primaryColor,
                    backgroundColor: primaryColor,
                    fixedSize: Size(120, 30),
                  ),
                  onPressed: () {},
                  child: Text('No',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(120, 30),
                    elevation: 15,
                    foregroundColor: Colors.white,

                    // onPrimary: darkBackgroundColor,
                    shadowColor: Colors.black.withOpacity(0.2),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Yes',
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
    ),
  );
}

// lib/screens/sign_in_screen.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:out_rate/themes/colors.dart';
import 'package:out_rate/view/sign_in_screen.dart';
import 'package:out_rate/view/sign_up_screen.dart';
import '../widgets/custom_elevated_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/sign_up_sign_in_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 50),
                  CustomButton(
                    backgroundColor: const Color(0xFFBDBDBD),
                    text: 'Sign in with your email',
                    onPressed: () {
                      Get.to(() => SignIn());
                      // Handle button press
                    },
                    textColor: darkBackgroundColor,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  RichText(
                    text: TextSpan(
                      text: 'Not a member? ',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up now',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Sign up now clicked');
                              Get.to(() =>  SignUp());
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                            },
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/splash_1.png',
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/signincontroller.dart';
import '../themes/colors.dart';
import '../widgets/custom_elevated_button.dart';
import '../view/home_screen.dart'; // Import the home screen

class SignIn extends StatelessWidget {
  final SignInController signInController = Get.put(SignInController());

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
              height: MediaQuery.of(context).size.height * 0.88,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/splash_1.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Image.asset(
                      'assets/images/logo_1.png',
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Sign In',
                      style: GoogleFonts.roboto(
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Enter your details below',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Username or email',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: signInController.usernameController,
                      decoration: InputDecoration(
                        hintText: "Username or Email",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/icons/icon_email.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Password',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Forgot pass clicked");
                            // Handle forgot password
                          },
                          child: Text(
                            'Forgot password?',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Stack(
                      children: [
                        TextFormField(
                          controller: signInController.passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/icons/icon_password.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Obx(() {
                      return signInController.isLoading.value
                          ? CircularProgressIndicator()
                          : CustomButton(
                        backgroundColor: Colors.black,
                        text: 'Sign in',
                        onPressed: () {
                          signInController.signIn();
                        },
                        textColor: lightBackgroundColor,
                      );
                    }),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.09),
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
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

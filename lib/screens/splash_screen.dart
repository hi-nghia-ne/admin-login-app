import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/profile_image.png',
      splashIconSize: 200,
      nextScreen: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginScreen(),
      ),
      splashTransition: SplashTransition.scaleTransition,
      curve: Curves.easeInOutSine,
    );
  }
}

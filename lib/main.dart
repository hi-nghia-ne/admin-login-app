import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   resizeToAvoidBottomInset: false,
      //   body: LoginScreen(),
      // ),
      home: AnimatedSplashScreen(
        splash: 'assets/images/profile_image.png',
        nextScreen: Scaffold(
          resizeToAvoidBottomInset: false,
          body: LoginScreen(),
        ),
        splashTransition: SplashTransition.scaleTransition,
      ),
    );
  }
}

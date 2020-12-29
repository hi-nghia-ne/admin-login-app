import 'package:flutter/material.dart';
import 'package:flutter_project_1/screens/splash_screen.dart';

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
      home: SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_project_1/screens/drawer_screen.dart';
import 'package:flutter_project_1/screens/main_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          MainScreen(),
        ],
      ),
    );
  }
}

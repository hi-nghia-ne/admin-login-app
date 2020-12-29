import 'package:flutter/material.dart';

class Greetings extends StatefulWidget {
  @override
  _GreetingsState createState() => _GreetingsState();
}

class _GreetingsState extends State<Greetings> {
  String _message;
  int _currentHour = DateTime.now().hour.toInt();
  @override
  Widget build(BuildContext context) {
    if (_currentHour < 12 && _currentHour > 5) {
      _message = 'Good Morning ☀';
    } else if (_currentHour >= 12 && _currentHour < 18) {
      _message = 'Good Afternoon 🌤';
    } else {
      _message = 'Good Evening 🌙';
    }

    return Text(
      _message,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_project_1/screens/home_screen.dart';
import 'package:flutter_project_1/widgets/password_field.dart';
import 'package:flutter_project_1/widgets/primary_button.dart';
import 'package:flutter_project_1/widgets/username_field.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoggedIn = false;
  final _formKey = GlobalKey<FormState>();

  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Colors.black;

  double _loginOffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();
    autoLogIn();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
        });
      },
    );
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLogined = await prefs.getBool('loginState') ?? false;

    if (isLogined) {
      setState(() {
        isLoggedIn = true;
      });
      return;
    }
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('loginState', true);

    setState(() {
      isLoggedIn = true;
    });

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Colors.black;
        _loginOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Color(0xFFB94D59);
        _headingColor = Colors.white;
        _loginOffset = _keyboardVisible ? 20 : 250;
        break;
    }

    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(
            milliseconds: 1000,
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          color: _backgroundColor,
          width: windowWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 0;
                  });
                },
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: windowWidth,
                  margin: EdgeInsets.only(bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        child: Text(
                          'Hi, I am Nghia',
                          style: TextStyle(
                            color: _headingColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Text(
                          'This is my Admin login app',
                          style: TextStyle(
                            color: _headingColor,
                            fontSize: 20,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 350,
                height: 350,
                child: Image(
                  image: AssetImage('assets/images/splash_bg.png'),
                ),
              ),
              PrimaryButton(
                btnText: 'Get Started',
                onCustomPressed: () {
                    setState(() {
                      !isLoggedIn
                          ? _pageState = 1
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                    });
                  },
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          transform: Matrix4.translationValues(0, _loginOffset, 1),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                offset: Offset(0, 4),
                blurRadius: 100,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          ),
          child: Container(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(30.0),
                      child: Text(
                        'Login To Continue',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    UsernameField(),
                    PasswordField(),
                    SizedBox(
                      height: windowHeight - 660,
                    ),
                    PrimaryButton(
                      btnText: 'Login',
                      onCustomPressed: () {
                        if (_formKey.currentState.validate()) {
                          loginUser();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

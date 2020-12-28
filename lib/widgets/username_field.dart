import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsernameField extends StatefulWidget {
  @override
  _UsernameFieldState createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  int _pageState = 0;
  Color _borderColor = Colors.black;
  Color _iconColor = Colors.black.withOpacity(0.35);
  String _username;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 30,
      ),
      child: Container(
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: _borderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: SvgPicture.asset(
                'assets/icons/username_icon.svg',
                color: _iconColor,
              ),
            ),
            Expanded(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty || value != 'admin') {
                    return 'Oops, username is incorrect';
                  }
                  return null;
                },
                onSaved: (value) => _username = value,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

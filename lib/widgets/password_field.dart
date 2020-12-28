import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  String _password;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: SvgPicture.asset(
                'assets/icons/password_icon.svg',
                color: Colors.black.withOpacity(0.35),
              ),
            ),
            Expanded(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty || value != 'admin') {
                    return 'Oops, password is incorrect';
                  }
                  return null;
                },
                onSaved: (value) => _password = value,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.black.withOpacity(0.35),
                ),
                onPressed: _toggle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_project_1/models/member.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MemberDetails extends StatefulWidget {
  final Member member;
  MemberDetails({this.member});
  @override
  _MemberDetailsState createState() => _MemberDetailsState();
}

class _MemberDetailsState extends State<MemberDetails> {
  Color _thumbUpColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFB94D59), Color(0xFFCA9661)],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    color: Color(0xFFF1F1F1),
                    child: Text(
                      'Here is some description about Elon. Let him know if you are interested. Or you just want to borrow some money.',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_up_alt_outlined,
                      color: _thumbUpColor,
                      size: 40,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_thumbUpColor != Colors.yellow)
                          _thumbUpColor = Colors.yellow;
                        else
                          _thumbUpColor = Colors.white;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 400,
              height: 400,
              margin: EdgeInsets.only(top: 93),
              child: Hero(
                tag: widget.member,
                child: Image.asset(
                  widget.member.avatarUrl,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 170.0),
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    offset: Offset(0, 4),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [Text(
                            widget.member.name,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: SvgPicture.asset(
                            'assets/icons/male_icon.svg',
                            width: 25,
                            height: 25,
                            color: Color(0xFFB59D49),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone_android_outlined),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.member.phoneNumber),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '"${widget.member.description}"',
                        style: TextStyle(fontSize: 20),
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

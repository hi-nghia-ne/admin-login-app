import 'package:flutter/material.dart';
import 'package:flutter_project_1/models/member.dart';
import 'package:flutter_project_1/widgets/member_card.dart';
import 'package:flutter_project_1/widgets/member_list.dart';
import 'package:flutter_project_1/widgets/new_member.dart';
import 'package:flutter_project_1/widgets/search_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _xOffset = 0;
  double _yOffset = 0;
  double _scaleFactor = 1;
  double _borderRadius = 0;

  int _pageState = 0;

  final List<Member> _memberLists = [
    // Member(
    //   avatarUrl: 'assets/images/elon-musk-avatar-medium.png',
    //   name: 'Elon Musk',
    //   phoneNumber: '0123-456-789',
    //   description: 'I am Iron Man',
    // ),
    // Member(
    //   avatarUrl: 'assets/images/elon-musk-avatar-medium.png',
    //   name: 'Elon Musk 2',
    //   phoneNumber: '0123-456-789',
    //   description: 'I am Iron Man',
    // ),
    // Member(
    //   avatarUrl: 'assets/images/elon-musk-avatar-medium.png',
    //   name: 'Elon Musk 2',
    //   phoneNumber: '0123-456-789',
    //   description: 'I am Iron Man',
    // ),
    // Member(
    //   avatarUrl: 'assets/images/elon-musk-avatar-medium.png',
    //   name: 'Elon Musk 2',
    //   phoneNumber: '0123-456-789',
    //   description: 'I am Iron Man',
    // ),
    Member(name: 'Elon', phoneNumber: '123', description: '123'),
  ];

  void _addNewMember(String newAvatarUrl, String newName, String newPhoneNumber,
      String newDescription) {
    final newMember = Member(
      avatarUrl: newAvatarUrl,
      name: newName,
      phoneNumber: newPhoneNumber,
      description: newDescription,
    );
    setState(() {
      _memberLists.add(newMember);
    });
  }

  void _startAddNewMember(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewMember(_addNewMember),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    switch (_pageState) {
      case 0:
        _xOffset = 0;
        _yOffset = 0;
        _scaleFactor = 1;
        _borderRadius = 0;
        break;
      case 1:
        _xOffset = 230;
        _yOffset = 160;
        _scaleFactor = 0.6;
        _borderRadius = 40;
        break;
    }
    return AnimatedContainer(
      transform: Matrix4.translationValues(_xOffset, _yOffset, 0)
        ..scale(_scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 80,
              bottom: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/menu_icon.svg',
                  ),
                  onPressed: () {
                    setState(() {
                      if (_pageState != 0)
                        _pageState = 0;
                      else
                        _pageState = 1;
                    });
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Good Morning ☀',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  child: CircleAvatar(
                    // backgroundColor: Color(0xFFB94D59),
                    radius: 22.0,
                    backgroundImage: AssetImage('assets/images/profile_image.png'),
                    backgroundColor: Color(0xFFB94D59),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 208 + 40,
            padding: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              color: Color(0xFFF1F1F1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  offset: Offset(0, 4),
                  blurRadius: 50,
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SearchBar(),
                  ),
                  MemberList(_memberLists),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

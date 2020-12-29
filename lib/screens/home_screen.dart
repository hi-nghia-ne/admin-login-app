import 'package:flutter/material.dart';
import 'package:flutter_project_1/models/member.dart';
import 'package:flutter_project_1/screens/drawer_screen.dart';
import 'package:flutter_project_1/screens/main_screen.dart';
import 'package:flutter_project_1/widgets/new_member.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Member> _memberList = [
    // Member(
    //   avatarUrl: 'assets/images/elon-musk-avatar-medium.png',
    //   name: 'Elon Musk',
    //   phoneNumber: '0123-456-789',
    //   description: 'I am Iron Man',
    // ),
    // Member(
    //   avatarUrl: 'assets/images/elon-musk-avatar-medium.png',
    //   name: 'Elon Mask',
    //   phoneNumber: '9876-543-210',
    //   description: 'I am Iron',
    // ),
  ];
  void _addNewMember(
    String newName,
    String newPhoneNumber,
    String newDescription,
  ) {
    final newMember = Member(
        name: newName,
        phoneNumber: newPhoneNumber,
        description: newDescription);
    setState(() {
      _memberList.add(newMember);
    });
  }

  void _startAddNewMember(BuildContext context) {
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (_) {
        return Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: NewMember(_addNewMember),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          MainScreen(_memberList),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFB94D59),
        child: Icon(Icons.add),
        onPressed: () => _startAddNewMember(context),
      ),
    );
  }
}

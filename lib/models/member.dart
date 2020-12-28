import 'package:flutter/cupertino.dart';

class Member {
  String avatarUrl = 'assets/images/elon-musk-avatar-medium.png';
  final String name;
  final String phoneNumber;
  final String description;

  Member({
    this.avatarUrl,
    @required this.name,
    @required this.phoneNumber,
    @required this.description,
  });
}

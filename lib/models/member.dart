import 'package:flutter/cupertino.dart';

class Member {
  final String avatarUrl = 'assets/images/elon-musk-avatar-medium.png';
  final String name;
  final String phoneNumber;
  final String description;
  bool isLike;

  Member({
    @required this.name,
    @required this.phoneNumber,
    @required this.description,
  });
}

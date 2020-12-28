import 'package:flutter/material.dart';
import 'package:flutter_project_1/models/member.dart';
import 'package:flutter_project_1/widgets/member_card.dart';

class MemberList extends StatelessWidget {
  final List<Member> members;
  MemberList(this.members);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: members.isEmpty
          ? Text('No member yet')
          : ListView.builder(
            primary: false,
            itemCount: members.length,
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 190,
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 40,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFB94D59),
                                    Color(0xFFCA9661)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.35),
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              child: Image.asset(
                                  'assets/images/elon-musk-avatar-medium.png'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 60,
                            bottom: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.35),
                                offset: Offset(0, 4),
                                blurRadius: 10,
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${members[index].name}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone_android_rounded),
                                  Text(
                                    '${members[index].phoneNumber}',
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('"${members[index].description}"'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

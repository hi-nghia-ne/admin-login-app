import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            offset: Offset(0, 4),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Icon(Icons.search),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Search something',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black.withOpacity(0.35),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

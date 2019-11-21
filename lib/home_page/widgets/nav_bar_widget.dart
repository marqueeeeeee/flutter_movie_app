

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "Movie",
          style: TextStyle(fontSize: 18, color: Colors.grey.shade200),
        ),
        SizedBox(
          width: 30,
        ),
        Text(
          "Tv Series",
          style: TextStyle(fontSize: 18, color: Colors.grey.shade200),
        ),
        Spacer(),
        Opacity(
          opacity: 0.7,
          child: CircleAvatar(
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
            backgroundColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}

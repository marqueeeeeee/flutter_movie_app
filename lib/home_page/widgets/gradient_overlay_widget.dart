import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.grey.withOpacity(0.0),
            Colors.black,
            Colors.black,
          ],
          stops: [0, 0.6, 1.0],
        ),
      ),
    );
  }
}
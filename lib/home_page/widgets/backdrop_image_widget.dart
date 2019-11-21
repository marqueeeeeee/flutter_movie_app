

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/mock_data.dart';

class BackDropImage extends StatelessWidget {
  final String path;

  BackDropImage(this.path);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Opacity(
        opacity: 0.9,
        child: AnimatedContainer(
          color: Colors.black,
          duration: Duration(milliseconds: 500),
          width: double.infinity,
          child: Image.network(
            MockData.domainO + path,
            alignment: Alignment.center,
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
      ),
    );
  }
}

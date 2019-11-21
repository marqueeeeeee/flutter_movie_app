

import 'package:flutter/material.dart';
import '../home_page.dart';
import 'movie_header_widget.dart';
import 'movie_list_view_widget.dart';

class MovieView extends StatelessWidget {
  final HomeViewState parent;

  MovieView(this.parent);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: HeaderMovieView(parent),
            flex: 9,
          ),
          Expanded(
            child: MovieListView(parent),
            flex: 7,
          )
        ],
      ),
    );
  }
}


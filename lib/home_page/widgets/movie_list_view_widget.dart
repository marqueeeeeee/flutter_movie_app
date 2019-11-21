import 'package:flutter/material.dart';
import 'package:movie_app/data/mock_data.dart';

import '../home_page.dart';

class MovieListView extends StatefulWidget {
  final HomeViewState parent;

  MovieListView(this.parent);

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        scrollDirection: Axis.horizontal,
        itemCount: MockData.movies.length,
        itemBuilder: (context, index) {
          return AnimatedContainer(
              padding: index != widget.parent.selectedIndex
                  ? EdgeInsets.fromLTRB(0, 20, 0, 0)
                  : EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Opacity(
                opacity: index != widget.parent.selectedIndex ? 0.5 : 1,
                child: InkWell(
                  onTap: () {
                    widget.parent.setState(() {
                      widget.parent.selectedIndex = index;
                    });
                  },
                  child: AspectRatio(
                    aspectRatio: 3 / 5,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(8.0),
                        child: Image.network(
                          MockData.domain + MockData.movies[index],
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.low,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 300));
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 20,
          );
        });
  }
}

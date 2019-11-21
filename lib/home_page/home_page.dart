import 'package:flutter/material.dart';
import 'package:movie_app/data/mock_data.dart';
import 'package:movie_app/home_page/widgets/backdrop_image_widget.dart';
import 'package:movie_app/home_page/widgets/gradient_overlay_widget.dart';
import 'package:movie_app/home_page/widgets/movie_view_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  var selectedIndex = 0;

  setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        BackDropImage(MockData.backdrop[selectedIndex]),
        GradientOverlay(),
        MovieView(this)
      ],
    );
  }
}



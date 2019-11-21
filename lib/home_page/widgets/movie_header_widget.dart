import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/mock_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import '../home_page.dart';
import 'nav_bar_widget.dart';

class HeaderMovieView extends StatelessWidget {
  final HomeViewState parent;

  HeaderMovieView(this.parent);

  _launchURL(String movieID) async {
    var url = 'https://youtube.com/embed/$movieID?autoplay=1;autohide=0;hd=0;';

    //check platform
    if (!kIsWeb) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      html.window.location.href = url;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 30, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          NavBarView(),
          Spacer(
            flex: 100,
          ),
          Text(
            MockData.movieTitle[parent.selectedIndex],
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Text(
                "2019",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                color: Colors.black,
                onPressed: () {
                  _launchURL(MockData.movieId[parent.selectedIndex]);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Play Trailer",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}

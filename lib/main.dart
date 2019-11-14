import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MovieApp());

var domain = "https://image.tmdb.org/t/p/w500/";
var domainO = "https://image.tmdb.org/t/p/original/";

var backdrop = [
  "/n6bUvigpRFqSwmPp1m2YADdbRBc.jpg",
  "/qAhedRxRYWZAgZ8O8pHIl6QHdD7.jpg",
  "/nRXO2SnOA75OsWhNhXstHB8ZmI3.jpg",
  "/61sbyO47yIpsMFyLhY1MWcqjg1Q.jpg",
  "/5myQbDzw3l8K9yofUXRJ4UTVgam.jpg",
  "/k2WyDw2NTUIWnuEs5gT7wgrCQg6.jpg",
  "/oMAhce30UvkgJwlzMwsuLaPJ5cG.jpg",
  "/m67smI1IIMmYzCl9axvKNULVKLr.jpg",
  "/k7sE3loFwuU2mqf7FbZBeE3rjBa.jpg",
  "/a6cDxdwaQIFjSkXf7uskg78ZyTq.jpg",
  "/7RyHsO4yDXtBv1zUU3mTpHeQ0d5.jpg",
  "/zIZv4pPJRg3YTnWWuotwXnYu1fM.jpg",
  "/qBI3Spq93lNxGzecdGpbwV5lOvU.jpg",
  "/4oSRQ03nJjl8sZAPgIXgi51XZva.jpg",
];

var movies = [
  "/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
  "/kvpNZAQow5es1tSY6XW2jAZuPPG.jpg",
  "/2bXbqYdUdNVa8VIWXVfclP2ICtT.jpg",
  "/xvYCZ740XvngXK0FNeSNVTJJJ5v.jpg",
  "/lcq8dVxeeOqHvvgcte707K0KVx5.jpg",
  "/fapXd3v9qTcNBTm39ZC4KUVQDNf.jpg",
  "/8u0QBGUbZcBW59VEAdmeFl9g98N.jpg",
  "/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg",
  "/ebe8hJRCwdflNQbUjRrfmqtUiNi.jpg",
  "/vqzNJRH4YyquRiWxCCOH0aXggHI.jpg",
  "/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
  "/tximyCXMEnWIIyOy9STkOduUprG.jpg",
  "/q5298SICFzqMcKtQoBktk8p6FH.jpg",
];

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

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
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.9,
          child: AnimatedContainer(
              color: Colors.black,
              duration: Duration(milliseconds: 500),
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              child: FadeInImage.assetNetwork(
                image: domainO + backdrop[selectedIndex],
                fit: BoxFit.cover, 
                placeholder: domain + backdrop[0],
              )),
        ),
        Container(
          decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.overlay,
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 0.2, 1.0])),
        ),
        MovieView(this)
      ],
    );
  }
}

class MovieView extends StatelessWidget {
  _HomeViewState parent;

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
            child: HeaderMovieView(),
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

class MovieListView extends StatefulWidget {
  _HomeViewState parent;

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
        itemCount: movies.length,
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
                        child: Image.network(domain + movies[index],
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
              curve: Curves.easeOut,
              duration: Duration(milliseconds: 200));
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 20,
          );
        });
  }
}

class HeaderMovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
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
          ),
          Spacer(),
          Text(
            "Joker",
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "2019",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                color: Colors.black,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Play Trailer",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

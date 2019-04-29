import 'package:flutter/material.dart';

import '../utils/Movie.dart';

class MovieSection extends StatelessWidget {
  final Film movie;
  final Function addMovie;

  MovieSection(this.movie,this.addMovie);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Column(
        children: <Widget>[
          Image.network(this.movie.images.poster.the1.medium.filmImage),
          Text(this.movie.filmName),
          Wrap(
            spacing: 10.0,
            children: this
                .movie
                .showings
                .standard
                .times
                .map((showtime) => RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      print('You want to watch at ${showtime.startTime}');
                      addMovie('${this.movie.filmName} at ${showtime.startTime}');
                    },
                    child: Text(showtime.startTime.toString())))
                .toList()
          ),
          RaisedButton(
            onPressed: () => print("You're watching " + this.movie.filmName),
            child: Text('Watch This'),
          )
        ],
      ),
    );
  }
}

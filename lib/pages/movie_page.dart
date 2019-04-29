import 'package:flutter/material.dart';

import '../components/movie_card.dart';

import '../utils/Movie.dart';
import '../utils/Theater.dart';
import '../utils/services.dart';

class MoviePage extends StatefulWidget {
  final Cinema search;

  MoviePage(this.search);
  @override
  State createState() => new MoviePageState(search);
}

class MoviePageState extends State<MoviePage> {
  List<Film> currentMovies = [Film(filmName: "Your Movie Queue"),Film(filmName:"   ")];
  Film selectedMovie;
  Cinema search;

  MoviePageState(search);

  addMovie(Film newMovie) {
    setState(() {
      currentMovies.add(newMovie);
    });
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: BackButton(),
            centerTitle: true,
            title: Text('MovieApp'),
            actions: <Widget>[
              DropdownButton(
                value: selectedMovie,
                onChanged: (Film newMovie) {
                  setState(() {
                    selectedMovie = newMovie;
                  });
                },
                items: currentMovies
                    .map((movie) => DropdownMenuItem(
                        value: movie, child: Text(movie.filmName)))
                    .toList(),
              ),
            ],
          ),
          body: FutureBuilder(
            future: getMovie(Cinema(cinemaName: "AMC Empire 25",cinemaId: 7114)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print(snapshot.connectionState);
                print(snapshot.data);
                Movie responseMovie = snapshot.data;
                return ListView(
                    children: responseMovie
                        .films
                        .map((film) => MovieSection(film, addMovie))
                        .toList());
              } 
              else
                return CircularProgressIndicator();
            },
          )),
    );
  }
}

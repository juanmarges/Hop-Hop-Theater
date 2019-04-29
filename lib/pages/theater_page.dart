import 'package:flutter/material.dart';

import '../components/theaters_list.dart';

import '../pages/movie_page.dart';

import '../utils/Theater.dart';
import '../utils/services.dart';

class TheaterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TheaterPageState();
}

class _TheaterPageState extends State<TheaterPage> {
  final pageTitle = 'Specify Theater';

  Cinema selectedCinema = Cinema(cinemaName: 'AMC Empire 25',cinemaId: 7114);

  List<Cinema> theaters = [Cinema(cinemaName: 'AMC Empire 25'),Cinema(cinemaName: "Please Work")];

  setTheaters(List<Cinema> newTheaters) {
    setState(() {
     theaters.clear() ;
     theaters.addAll(newTheaters);
    });
  }

  setSelectedTheater(Cinema theater) {
    selectedCinema = theater;
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      title: pageTitle,
      home: Scaffold(
          appBar: AppBar(
            title: Text(pageTitle),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Column(children: <Widget>[
            RaisedButton(
              onPressed: () {
                getTheaters().then((response) {
                  response.cinemas.forEach((cinema) => print(cinema.cinemaName + cinema.cinemaId.toString()));
                  setTheaters(response.cinemas);
                });
              },
              child:Text("Load Theaters")
            ),
            TheaterList(theaters,setSelectedTheater),
            RaisedButton(onPressed: (){
              print(selectedCinema.cinemaName);
              Navigator.push(context,MaterialPageRoute(builder: (context) => MoviePage(selectedCinema)));
            }, 
            child: Text("See Movies")
            )
          ],)
          ),
    );
  }
}

import 'package:http/http.dart' as http;
import 'dart:async';

import './Movie.dart';
import './Theater.dart';



Future<Movie> getMovie(Cinema search) async {
  String geolocation = "40.7568845;-73.9903222";
  DateTime now = DateTime.now().toLocal();
  String nowDate = "${now.year}-${now.month.toString().padLeft(2,"0")}-${now.day}";
  String nowTime = "T${now.hour.toString().padLeft(2,"0")}:${now.minute.toString().padLeft(2,"0")}:${now.second.toString().padLeft(2,"0")}.${now.millisecond.toString().padLeft(2,"0")}Z";
  Map<String, String> header = {
    "Content": "application/json",
    "client": "FULL_0",
    "x-api-key": "DkX00x4idz4fe2Rfoo1L185U6M1u95BJaDP2a5a5",
    "authorization": "Basic RlVMTF8wOjVxRG00SFR5aWJEbw==",
    "api-version": "v200",
    "territory": "US",
    "device-datetime": nowDate+nowTime,
    "geolocation": geolocation
  };
  String baseUrl = 'https://api-gate2.movieglu.com/cinemaShowTimes/';
  String url = baseUrl + "?cinema_id=" + search.cinemaId.toString() + "&date=" + nowDate;
  final response = await http.get(url,headers: header);
  print(response.body);
  return movieFromJson(response.body);
}

Future<Theater> getTheaters() async {
  String geolocation = "40.7568845;-73.9903222";
  DateTime now = DateTime.now().toLocal();
  String nowDate = "${now.year}-${now.month.toString().padLeft(2,"0")}-${now.day}";
  String nowTime = "T${now.hour.toString().padLeft(2,"0")}:${now.minute.toString().padLeft(2,"0")}:${now.second.toString().padLeft(2,"0")}.${now.millisecond.toString().padLeft(2,"0")}Z";
  Map<String, String> header = {
    "Content": "application/json",
    "client": "FULL_0",
    "x-api-key": "DkX00x4idz4fe2Rfoo1L185U6M1u95BJaDP2a5a5",
    "authorization": "Basic RlVMTF8wOjVxRG00SFR5aWJEbw==",
    "api-version": "v200",
    "territory": "US",
    "device-datetime": nowDate+nowTime,
    "geolocation": geolocation
  };
  String baseUrl = "https://api-gate2.movieglu.com/cinemasNearby/?n=6";
  final response = await http.get(baseUrl,headers: header);
  return theaterFromJson(response.body);
}

// Widget buildMovieCard(Cinema search,Function addMovie) {
//   return new FutureBuilder<Film>(
//       future: getMovie(search),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done)
//           return MovieSection(snapshot.data,addMovie);
//         else
//           return CircularProgressIndicator();
//       });
// }

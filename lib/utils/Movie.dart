import 'dart:convert';

import './Theater.dart';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
    Cinema cinema;
    List<Film> films;
    Status status;

    Movie({
        this.cinema,
        this.films,
        this.status,
    });

    factory Movie.fromJson(Map<String, dynamic> json) => new Movie(
        cinema: Cinema.fromJson(json["cinema"]),
        films: new List<Film>.from(json["films"].map((x) => Film.fromJson(x))),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "cinema": cinema.toJson(),
        "films": new List<dynamic>.from(films.map((x) => x.toJson())),
        "status": status.toJson(),
    };
}

class Film {
    int filmId;
    int imdbId;
    String filmName;
    String versionType;
    List<AgeRating> ageRating;
    Images images;
    Showings showings;
    List<ShowDate> showDates;

    Film({
        this.filmId,
        this.imdbId,
        this.filmName,
        this.versionType,
        this.ageRating,
        this.images,
        this.showings,
        this.showDates,
    });

    factory Film.fromJson(Map<String, dynamic> json) => new Film(
        filmId: json["film_id"],
        imdbId: json["imdb_id"],
        filmName: json["film_name"],
        versionType: json["version_type"],
        ageRating: new List<AgeRating>.from(json["age_rating"].map((x) => AgeRating.fromJson(x))),
        images: Images.fromJson(json["images"]),
        showings: Showings.fromJson(json["showings"]),
        showDates: new List<ShowDate>.from(json["show_dates"].map((x) => ShowDate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "film_id": filmId,
        "imdb_id": imdbId,
        "film_name": filmName,
        "version_type": versionType,
        "age_rating": new List<dynamic>.from(ageRating.map((x) => x.toJson())),
        "images": images.toJson(),
        "showings": showings.toJson(),
        "show_dates": new List<dynamic>.from(showDates.map((x) => x.toJson())),
    };
}

class AgeRating {
    String rating;
    String ageRatingImage;
    String ageAdvisory;

    AgeRating({
        this.rating,
        this.ageRatingImage,
        this.ageAdvisory,
    });

    factory AgeRating.fromJson(Map<String, dynamic> json) => new AgeRating(
        rating: json["rating"],
        ageRatingImage: json["age_rating_image"],
        ageAdvisory: json["age_advisory"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating,
        "age_rating_image": ageRatingImage,
        "age_advisory": ageAdvisory,
    };
}

class Images {
    Poster poster;
    Still still;

    Images({
        this.poster,
        this.still,
    });

    factory Images.fromJson(Map<String, dynamic> json) => new Images(
        poster: Poster.fromJson(json["poster"]),
        still: json["still"] == null ? null : Still.fromJson(json["still"]),
    );

    Map<String, dynamic> toJson() => {
        "poster": poster.toJson(),
        "still": still == null ? null : still.toJson(),
    };
}

class Poster {
    Poster1 the1;

    Poster({
        this.the1,
    });

    factory Poster.fromJson(Map<String, dynamic> json) => new Poster(
        the1: Poster1.fromJson(json["1"]),
    );

    Map<String, dynamic> toJson() => {
        "1": the1.toJson(),
    };
}

class Poster1 {
    String imageOrientation;
    String region;
    Medium medium;

    Poster1({
        this.imageOrientation,
        this.region,
        this.medium,
    });

    factory Poster1.fromJson(Map<String, dynamic> json) => new Poster1(
        imageOrientation: json["image_orientation"],
        region: json["region"],
        medium: Medium.fromJson(json["medium"]),
    );

    Map<String, dynamic> toJson() => {
        "image_orientation": imageOrientation,
        "region": region,
        "medium": medium.toJson(),
    };
}

class Medium {
    String filmImage;
    int width;
    int height;

    Medium({
        this.filmImage,
        this.width,
        this.height,
    });

    factory Medium.fromJson(Map<String, dynamic> json) => new Medium(
        filmImage: json["film_image"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "film_image": filmImage,
        "width": width,
        "height": height,
    };
}

class Still {
    Still1 the1;

    Still({
        this.the1,
    });

    factory Still.fromJson(Map<String, dynamic> json) => new Still(
        the1: Still1.fromJson(json["1"]),
    );

    Map<String, dynamic> toJson() => {
        "1": the1.toJson(),
    };
}

class Still1 {
    String imageOrientation;
    Medium medium;

    Still1({
        this.imageOrientation,
        this.medium,
    });

    factory Still1.fromJson(Map<String, dynamic> json) => new Still1(
        imageOrientation: json["image_orientation"],
        medium: Medium.fromJson(json["medium"]),
    );

    Map<String, dynamic> toJson() => {
        "image_orientation": imageOrientation,
        "medium": medium.toJson(),
    };
}

class ShowDate {
    DateTime date;

    ShowDate({
        this.date,
    });

    factory ShowDate.fromJson(Map<String, dynamic> json) => new ShowDate(
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    };
}

class Showings {
    Standard standard;
    Standard the3D;

    Showings({
        this.standard,
        this.the3D,
    });

    factory Showings.fromJson(Map<String, dynamic> json) => new Showings(
        standard: Standard.fromJson(json["Standard"]),
        the3D: json["3D"] == null ? null : Standard.fromJson(json["3D"]),
    );

    Map<String, dynamic> toJson() => {
        "Standard": standard.toJson(),
        "3D": the3D == null ? null : the3D.toJson(),
    };
}

class Standard {
    int filmId;
    String filmName;
    List<Time> times;

    Standard({
        this.filmId,
        this.filmName,
        this.times,
    });

    factory Standard.fromJson(Map<String, dynamic> json) => new Standard(
        filmId: json["film_id"],
        filmName: json["film_name"],
        times: new List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "film_id": filmId,
        "film_name": filmName,
        "times": new List<dynamic>.from(times.map((x) => x.toJson())),
    };
}

class Time {
    String startTime;
    String endTime;

    Time({
        this.startTime,
        this.endTime,
    });

    factory Time.fromJson(Map<String, dynamic> json) => new Time(
        startTime: json["start_time"],
        endTime: json["end_time"],
    );

    Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
    };
}

class Status {
    int count;
    String state;
    String method;
    dynamic message;
    String requestMethod;
    String version;
    String territory;
    DateTime deviceDatetimeSent;
    DateTime deviceDatetimeUsed;

    Status({
        this.count,
        this.state,
        this.method,
        this.message,
        this.requestMethod,
        this.version,
        this.territory,
        this.deviceDatetimeSent,
        this.deviceDatetimeUsed,
    });

    factory Status.fromJson(Map<String, dynamic> json) => new Status(
        count: json["count"],
        state: json["state"],
        method: json["method"],
        message: json["message"],
        requestMethod: json["request_method"],
        version: json["version"],
        territory: json["territory"],
        deviceDatetimeSent: DateTime.parse(json["device_datetime_sent"]),
        deviceDatetimeUsed: DateTime.parse(json["device_datetime_used"]),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "state": state,
        "method": method,
        "message": message,
        "request_method": requestMethod,
        "version": version,
        "territory": territory,
        "device_datetime_sent": deviceDatetimeSent.toIso8601String(),
        "device_datetime_used": deviceDatetimeUsed.toIso8601String(),
    };
}

// Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));
// List<Movie> moviesFromJson(String str) => new List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

// String movieToJson(Movie data) => json.encode(data.toJson());

// class Movie {
//     String title;
//     String released;
//     String runtime;
//     String poster;
//     String imdbId;
//     Duration _runtime;
//     List<DateTime> _showtimes = [];

//     Movie({this.title,this.released,this.runtime,this.poster,this.imdbId,}) {
//       var wholeMinutes = int.parse(runtime.substring(0,runtime.indexOf(" ")));
//       int hours = (wholeMinutes / 60).floor();
//       int minutes = wholeMinutes % 60;
//       print('Total minutes $wholeMinutes as $hours hours and $minutes minutes');
//       _runtime = new Duration(hours: hours, minutes: minutes);
//       DateTime show = DateTime.now().toLocal();
//       for (var i = 0; i < 8; i++) {
//         this._showtimes.add(show);
//         show = show.add(this._runtime);
//       }
//     }

//     factory Movie.fromJson(Map<String, dynamic> json) => new Movie(
//         title: json["Title"],
//         released: json["Released"],
//         runtime: json["Runtime"],
//         poster: json["Poster"],
//         imdbId: json["imdbID"],
//     );

//     Map<String, dynamic> toJson() => {
//         "Title": title,
//         "Released": released,
//         "Runtime": runtime,
//         "Poster": poster,
//         "imdbID": imdbId,
//     };

//   String get runtimeDetails =>
//       "${_runtime.inHours} hr ${_runtime.inMinutes % 60} min";
//   List<String> get showtimes => _showtimes
//       .map((showtime) => "${(showtime.hour % 12).toString().padLeft(2,"0")}:${showtime.minute.toString().padLeft(2,"0")}")
//       .toList();
// }

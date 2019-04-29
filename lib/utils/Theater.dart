import 'dart:convert';


Theater theaterFromJson(String str) => Theater.fromJson(json.decode(str));

String theaterToJson(Theater data) => json.encode(data.toJson());

class Theater {
    List<Cinema> cinemas;
    Status status;

    Theater({
        this.cinemas,
        this.status,
    });

    factory Theater.fromJson(Map<String, dynamic> json) => new Theater(
        cinemas: new List<Cinema>.from(json["cinemas"].map((x) => Cinema.fromJson(x))),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "cinemas": new List<dynamic>.from(cinemas.map((x) => x.toJson())),
        "status": status.toJson(),
    };
}

class Cinema {
    int cinemaId;
    String cinemaName;
    String address;
    String address2;
    String city;
    String county;
    int postcode;
    double lat;
    double lng;
    double distance;
    String logoUrl;

    Cinema({
        this.cinemaId,
        this.cinemaName,
        this.address,
        this.address2,
        this.city,
        this.county,
        this.postcode,
        this.lat,
        this.lng,
        this.distance,
        this.logoUrl,
    });

    factory Cinema.fromJson(Map<String, dynamic> json) => new Cinema(
        cinemaId: json["cinema_id"],
        cinemaName: json["cinema_name"],
        address: json["address"],
        address2: json["address2"],
        city: json["city"],
        county: json["county"],
        postcode: json["postcode"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        distance: json["distance"].toDouble(),
        logoUrl: json["logo_url"],
    );

    Map<String, dynamic> toJson() => {
        "cinema_id": cinemaId,
        "cinema_name": cinemaName,
        "address": address,
        "address2": address2,
        "city": city,
        "county": county,
        "postcode": postcode,
        "lat": lat,
        "lng": lng,
        "distance": distance,
        "logo_url": logoUrl,
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








// List<Theater> theaterFromJson(String str) => new List<Theater>.from(json.decode(str).map((x) => Theater.fromJson(x)));

// String theaterToJson(List<Theater> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

// class Theater {
//     String name;
//     String path;

//     Theater({
//         this.name,
//         this.path,
//     });

//     factory Theater.fromJson(Map<String, dynamic> json) => new Theater(
//         name: json["name"],
//         path: json["path"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "path": path,
//     };
// }

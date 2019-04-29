import 'package:flutter/material.dart';

import './theater_page.dart';
// import './movie_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Theme.of(context).primaryColor,
      child: new InkWell(
        onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => TheaterPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Hop-Hop-Theater",textAlign: TextAlign.center ,style: new TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
            new Text("Tap to Start",textAlign: TextAlign.center ,style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
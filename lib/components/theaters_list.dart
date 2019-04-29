import 'package:flutter/material.dart';

import '../utils/Theater.dart';

class TheaterList extends StatefulWidget {
  final List<Cinema> theaters;
  final Function setSelectedTheater;

  TheaterList(this.theaters,this.setSelectedTheater);

  @override
  State<StatefulWidget> createState() => TheaterListState(theaters,setSelectedTheater);
}

class TheaterListState extends State<TheaterList> {
  List<Cinema> theaters;
  Cinema selectedTheater;
  Function setSelectedTheater;

  TheaterListState(this.theaters,this.setSelectedTheater);

  @override
  Widget build(BuildContext context) {
    
    return DropdownButtonFormField(
        value: selectedTheater,
        onChanged: (Cinema newTheater) {
          setSelectedTheater(newTheater);
          setState(() {
            selectedTheater = newTheater;
          });
        },
        items: theaters
            .map((theater) => DropdownMenuItem(
              value: theater,
              child: Text(theater.cinemaName)))
            .toList());
  }
}

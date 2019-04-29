import 'package:flutter/material.dart';

import '../utils/Theater.dart';
import '../utils/services.dart';

class ZipCodeForm extends StatefulWidget {
  final Function setTheaters;
  
  ZipCodeForm(this.setTheaters);

  @override
  ZipCodeFormState createState() {
    return ZipCodeFormState(setTheaters);
  }
}

class ZipCodeFormState extends State<ZipCodeForm> {
  final _formKey = GlobalKey<FormState>();
  int zip;

  final Function setTheaters;

  ZipCodeFormState(this.setTheaters);

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
        key: _formKey,
        child: ListTileTheme(
          dense: true,
          child: ListTile(
            leading: Text('Zipcode'),
            title: TextFormField(
                onSaved: (String value) => this.zip = int.parse(value),
                keyboardType: TextInputType.number,
                validator: (String value) {
                  if (value.length != 5 || int.tryParse(value) == null) {
                    return 'Please enter a valid zipcode';
                  }
                },
              ),
            trailing: RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                  getTheaters().then((response) {
                    List<Cinema> theaters = response.cinemas;
                    setTheaters(theaters.toList());
                  });
                  // setTheaters(["CMA","Village West"]);
                }
              },
            ),
          ),
        )
        );
  }
}

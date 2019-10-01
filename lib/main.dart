import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double bmr = 0;

  double cal = 0, height = 0.0, weight = 0.0;
  var _sex = ['male', 'female'];
  var _currentItemSelected = 'male';
  var _choice = [
    'I am sedentary',
    'I am lightly active',
    'I am slightly active',
    'I am highly active',
    'I am super active'
  ];
  var _currentItemSelected2 = 'I am sedentary';

  int age = 0;
  TextEditingController _agefield = TextEditingController();
  TextEditingController _heightfield = TextEditingController();
  TextEditingController _weightfield = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMR',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMRcalc',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Text('Gender:'),
              DropdownButton<String>(
                items: _sex.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValueSelected) {
                  setState(() {
                    this._currentItemSelected = newValueSelected;
                  });
                },
                value: _currentItemSelected,
              ),
              TextField(
                controller: _agefield,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: 'Enter Age',
                  icon: new Icon(Icons.calendar_today),
                ),
              ),
              TextField(
                controller: _heightfield,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: 'Height in cm',
                  icon: new Icon(Icons.info),
                ),
              ),
              TextField(
                controller: _weightfield,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: 'Weight in kg',
                  icon: new Icon(Icons.shutter_speed),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 10, 0, 0),
                child: Text('Daily Calory Requirement:'),
              ),
              DropdownButton<String>(
                items: _choice.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValueSelected2) {
                  setState(() {
                    this._currentItemSelected2 = newValueSelected2;
                  });
                },
                value: _currentItemSelected2,
              ),
              Padding(
                padding: const EdgeInsets.all(7.5),
                child: RaisedButton(
                  onPressed: () {
                    _calculateBMR();
                    if (height <= 0.0 && weight <= 0.0) {
                      error();
                    }
                  },
                  child: new Text('CALCULATE',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  color: Colors.red[800],
                  textColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.5),
                child: Container(
                  child: Text(
                    bmr != 0.0 ? result() : '',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _calculateBMR() {
    age = int.parse(_agefield.text);
    height = double.parse(_heightfield.text);
    weight = double.parse(_weightfield.text);

    setState(() {
      if (_currentItemSelected.toString() == 'male' &&
          _currentItemSelected2.toString() == 'I am sedentary') {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
        cal = bmr * 1.2;
      } else if (_currentItemSelected.toString() == 'male' &&
          _currentItemSelected2.toString() == "I am lightly active") {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
        cal = bmr * 1.375;
      } else if (_currentItemSelected.toString() == 'male' &&
          _currentItemSelected2.toString() == "I am slightly active") {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
        cal = bmr * 1.55;
      } else if (_currentItemSelected.toString() == 'male' &&
          _currentItemSelected2.toString() == "I am highly active") {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
        cal = bmr * 1.725;
      } else if (_currentItemSelected.toString() == 'male' &&
          _currentItemSelected2.toString() == "I am super active") {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
        cal = bmr * 1.9;
      } else if (_currentItemSelected.toString() == 'female' &&
          _currentItemSelected2.toString() == "I am sedentary") {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
        cal = bmr * 1.2;
      } else if (_currentItemSelected.toString() == 'female' &&
          _currentItemSelected2.toString() == "I am lightly active") {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
        cal = bmr * 1.375;
      } else if (_currentItemSelected.toString() == 'female' &&
          _currentItemSelected2.toString() == "I am slightly active") {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
        cal = bmr * 1.55;
      } else if (_currentItemSelected.toString() == 'female' &&
          _currentItemSelected2.toString() == "I am highly active") {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
        cal = bmr * 1.725;
      } else if (_currentItemSelected.toString() == 'female' &&
          _currentItemSelected2.toString() == "I am super active") {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
        cal = bmr * 1.9;
      }
    });
  }

  String result() {
    return 'your BMR is : \n' +
        bmr.toStringAsFixed(2) +
        '\n' +
        'maintenance calories per day\n' +
        cal.toStringAsFixed(2);
  }

  void error() {
    Text('please input appropriate number');
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/helpers/dialog_helper.dart';

class BmiHomePage extends StatefulWidget {
  @override
  _BmiHomePageState createState() => _BmiHomePageState();
}

class _BmiHomePageState extends State<BmiHomePage> {
  var _height, _weight, _calculatedbmi, resultImg, outputMsg;

  List<String> images = [
    './images/noresult.png',
    './images/thincat.png',
    './images/greatbody.jpg',
    './images/Overweight.png',
    './images/Obese.png',
    './images/thinking.png',
  ];

  List<String> output = [
    'Do you think I am an Idiot?',
    'Underweight',
    'Great Shape!',
    'Overweight',
    'Obese'
  ];

  TextEditingController _agecontroller = new TextEditingController();
  TextEditingController _heightcontroller = new TextEditingController();
  TextEditingController _weightontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "BMI",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 50,
                        fontFamily: 'LuckiestGuy',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _agecontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Age',
                        hintText: 'e.g. 21',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _heightcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Height in cm',
                        hintText: 'e.g. 168',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _weightontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Weight in kg',
                        hintText: 'e.g. 56',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if ((_heightcontroller.text).isEmpty ||
                        (_weightontroller.text).isEmpty ||
                        (_agecontroller.text).isEmpty) {
                      _calculatedbmi = 'N/A';
                      resultImg = images[0];
                      outputMsg = 'Please fill all the fields';
                    } else if (isNumeric(_heightcontroller.text) == false ||
                        isNumeric(_weightontroller.text) == false ||
                        isNumeric(_agecontroller.text) == false) {
                      _calculatedbmi = 'N/A';
                      resultImg = images[5];
                      outputMsg = 'Invalid Format';
                    } else {
                      _height = double.parse(_heightcontroller.text);
                      _weight = double.parse(_weightontroller.text);

                      _calculatedbmi = (_weight / pow((_height / 100.0), 2))
                          .toStringAsFixed(2);
                      _calculatedbmi = double.parse(_calculatedbmi);
                      print(_calculatedbmi);
                      if (_calculatedbmi < 18.5) {
                        resultImg = images[1];
                        outputMsg = output[1];
                      } else if (_calculatedbmi >= 18.5 && _calculatedbmi < 25) {
                        resultImg = images[2];
                        outputMsg = output[2];
                      } else if (_calculatedbmi >= 25 && _calculatedbmi < 30) {
                        resultImg = images[3];
                        outputMsg = output[3];
                      } else {
                        resultImg = images[4];
                        outputMsg = output[4];
                      }
                    }

                    DialogHelper.exit(
                        context, _calculatedbmi, resultImg, outputMsg);
                  });
                },
                color: const Color(0xFFfd79a8),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontFamily: 'LuckiestGuy',
                      fontStyle: FontStyle.normal,
                      fontSize: 25.0,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                elevation: 6.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isNumeric(String text) {
  if (text == null) {
    return false;
  }
  return double.tryParse(text) != null;
}

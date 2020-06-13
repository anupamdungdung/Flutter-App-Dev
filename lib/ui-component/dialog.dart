import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  var _calculatedbmi;
  String imageSrc;
  var outputMsg;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: <Widget>[
          Container(
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'BMI Result',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'LuckiestGuy',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.redAccent,
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset(
            imageSrc,
            height: 150,
            width: 150,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Your BMI is: $_calculatedbmi',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Bahnschrift',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            outputMsg,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Bahnschrift',
              fontStyle: FontStyle.italic
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            child: Text(
              'Okay',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'LuckiestGuy',
              ),
            ),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  ResultDialog(var calculatedbmi, String imgSrc,var outputMsg) {
    this._calculatedbmi = calculatedbmi;
    this.imageSrc = imgSrc;
    this.outputMsg=outputMsg;
  }
}

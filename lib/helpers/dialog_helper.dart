import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/ui-component/dialog.dart';

class DialogHelper{
  static exit(context,_calculatedbmi,imagesrc,outputMsg) => showDialog(context: context,builder: (context) => ResultDialog(_calculatedbmi,imagesrc,outputMsg));
}
import 'package:flutter/material.dart';

class TextComponent extends StatefulWidget {
  @override
  _TextComponentState createState() => _TextComponentState();
}

class _TextComponentState extends State<TextComponent> {
  @override
  Widget build(BuildContext context) {
    return new Text("Hello World",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),);
  }
}
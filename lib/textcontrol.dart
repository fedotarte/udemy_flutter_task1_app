import 'package:flutter/material.dart';

class TextController extends StatelessWidget {
  final Function textHandler;

  TextController(this.textHandler);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.teal[200],
      textColor: Colors.white70,
      onPressed: textHandler,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.teal)
      ),
      child: Icon(Icons.arrow_forward),
    );
  }
}

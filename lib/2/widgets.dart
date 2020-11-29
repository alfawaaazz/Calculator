import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Function buttonPress;

  Button(this.buttonText, this.buttonPress);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.all(25),
        color: Colors.indigo[900],
        onPressed: () {
          buttonPress(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final String result;

  ResultDisplay(this.result);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.indigo[800],
      child: Container(
        padding: EdgeInsets.only(bottom: 15, right: 15),
        alignment: Alignment.bottomRight,
        child: Text(
          result,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

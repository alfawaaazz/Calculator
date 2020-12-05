import 'package:Calculator/calculatorbloc/calculatorblocscreen.dart';
import 'package:Calculator/home.dart';
import 'package:Calculator/2/homescreen.dart';
import 'package:Calculator/tadascounterbloc/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorBlocScreen.create(context),
    );
  }
}

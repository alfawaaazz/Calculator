import 'package:Calculator/2/resultDisplay.dart';
import 'package:Calculator/2/widgets.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = "";
  String parenthesis;
  String expression;
  bool toggle;

  buttonPress(String buttonString) {
    print(buttonString);
    setState(() {
      //  m.buttonPress(buttonString);
      if (buttonString == "C") {
        result = "";
        toggle = false;
      } else if (buttonString == "<-") {
        result = result.substring(0, result.length - 1);
        toggleFunction();
        if (result == "") {
          result = "";
        }
      } else if (buttonString == "=") {
        expression = result;
        print("Expression: $expression");

        expression = expression.replaceAll("x", "*");
        expression = expression.replaceAll("÷", "/");
        print("Expression2: $expression");

        try {
          String answer;
          Parser parser = Parser();
          Expression exp = parser.parse(expression);

          ContextModel cm = ContextModel();
          // result = exp.evaluate(EvaluationType.REAL, cm).toString();
          answer = "${(exp.evaluate(EvaluationType.REAL, cm))}";
          if (answer == "Infinity") {
            result = "Math Error";
          } else {
            result = answer;
          }
          //result = answer;
          print(answer);
        } catch (e) {
          print(e);
          // result = "Error";
          if (e.toString().contains("RangeError (index)")) {
            result = "Syntax Error";
          } else {
            result = "Error";
          }
        }
      } else if (buttonString == "0") {
        if (result.contains("Error")) {
          result = "0";
        } else {
          result = result + buttonString;
        }
      } else {
        if (buttonString == "()") {
          if (toggle == null) {
            toggle = false;
          } else if (toggle != null) {
            if (toggle == false) {
              parenthesis = "(";
              buttonString = parenthesis;
              toggle = true;
            } else {
              parenthesis = ")";
              buttonString = parenthesis;
              toggle = false;
            }
          }
          if (result == "0") {
            result = buttonString;
          } else {
            result = result + buttonString;
          }
        } else if (result == "0") {
          result = buttonString;
        } else {
          result = result + buttonString;
        }
      }
    });
  }

  toggleFunction() {
    if (toggle == true) {
      toggle = false;
    } else {
      toggle = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Column(
        children: [
          ResultDisplay(result),
          Row(
            children: [
              Button("C", buttonPress),
              Button("()", buttonPress),
              Button("<-", buttonPress),
              Button("÷", buttonPress),
            ],
          ),
          Row(
            children: [
              Button("7", buttonPress),
              Button("8", buttonPress),
              Button("9", buttonPress),
              Button("x", buttonPress),
            ],
          ),
          Row(
            children: [
              Button("4", buttonPress),
              Button("5", buttonPress),
              Button("6", buttonPress),
              Button("-", buttonPress),
            ],
          ),
          Row(
            children: [
              Button("1", buttonPress),
              Button("2", buttonPress),
              Button("3", buttonPress),
              Button("+", buttonPress),
            ],
          ),
          Row(
            children: [
              Button("00", buttonPress),
              Button("0", buttonPress),
              Button(".", buttonPress),
              Button("=", buttonPress),
            ],
          ),
        ],
      ),
    );
  }
}

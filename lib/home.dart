import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int firstNum = 0;
  int secondNum;
  int result;
  String operation;

  Widget buttonWidget({String text, Function buttonPress}) {
    return Expanded(
      child: FlatButton(
        onPressed: buttonPress,
        padding: EdgeInsets.all(27),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            color: Colors.indigo[700],
          ),
        ),
      ),
    );
  }

  numPress(int number) {
    print("Hello $number");
    setState(() {
      if (result != null) {
        result = null;
        firstNum = number;
      } else if (firstNum == null) {
        firstNum = number;
      } else if (operation == null) {
        firstNum = int.parse("$firstNum$number");
      } else if (secondNum == null) {
        secondNum = number;
      } else {
        secondNum = int.parse("$secondNum$number");
      }
    });
  }

  oprPress(String opr) {
    print("opr: $opr");

    operation = opr;

    if (operation == "+") {
    } else if (operation == "-") {
    } else if (operation == "x") {
    } else if (operation == "/") {}
  }

  eqPress() {
    print("eq");
    if (operation == "+" && secondNum != null) {
      result = firstNum + secondNum;
      print("Sum: $result");
      setState(() {});
    } else if (operation == "-") {
    } else if (operation == "x") {
    } else if (operation == "/") {}
  }

  clrPress() {
    print("clr");
    setState(() {
      firstNum = null;
      secondNum = null;
      result = null;
    });
  }

  deleteLast() {
    List<String> dispChar = displayValue.split("");
    dispChar.removeLast();
    print(dispChar.join());
  }

  otherOp() {
    print("other");
  }

  String get displayValue {
    String resultText;
    if (result != null) {
      resultText = result.toString();
    } else if (secondNum != null) {
      resultText = "$firstNum$operation$secondNum";
    } else if (operation != null) {
      resultText = "$firstNum$operation";
    } else if (firstNum != null) {
      resultText = "$firstNum";
    } else {
      resultText = "0";
    }
    return resultText;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(displayValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Colors.indigo[900],
            height: 300,
            child: Container(
              // color: Colors.green,
              padding: EdgeInsets.only(bottom: 20, right: 20),
              alignment: Alignment.bottomRight,
              child: Text(
                displayValue,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              buttonWidget(text: "C", buttonPress: () => clrPress()),
              buttonWidget(text: "( )", buttonPress: () => otherOp()),
              buttonWidget(text: "<-", buttonPress: () => deleteLast()),
              buttonWidget(text: "/", buttonPress: () => oprPress("/")),
            ],
          ),
          Row(
            children: <Widget>[
              buttonWidget(text: "7", buttonPress: () => numPress(7)),
              buttonWidget(text: "8", buttonPress: () => numPress(8)),
              buttonWidget(text: "9", buttonPress: () => numPress(9)),
              buttonWidget(text: "x", buttonPress: () => oprPress("x")),
            ],
          ),
          Row(
            children: <Widget>[
              buttonWidget(text: "4", buttonPress: () => numPress(4)),
              buttonWidget(text: "5", buttonPress: () => numPress(5)),
              buttonWidget(text: "6", buttonPress: () => numPress(6)),
              buttonWidget(text: "-", buttonPress: () => oprPress("-")),
            ],
          ),
          Row(
            children: <Widget>[
              buttonWidget(text: "1", buttonPress: () => numPress(1)),
              buttonWidget(text: "2", buttonPress: () => numPress(2)),
              buttonWidget(text: "3", buttonPress: () => numPress(3)),
              buttonWidget(text: "+", buttonPress: () => oprPress("+")),
            ],
          ),
          Row(
            children: <Widget>[
              buttonWidget(text: "00", buttonPress: () => numPress(00)),
              buttonWidget(text: "0", buttonPress: () => numPress(0)),
              buttonWidget(text: ".", buttonPress: () => otherOp()),
              buttonWidget(text: "=", buttonPress: () => eqPress()),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:Calculator/calculatorbloc/calculatormodel.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorBlocTest {
  final StreamController<CalculatorModel> _modelController =
      StreamController<CalculatorModel>();

  Stream<CalculatorModel> get modelStream => _modelController.stream;
  CalculatorModel _model = CalculatorModel();

  void dispose() {
    _modelController.close();
  }

  void updateWith({
    String result,
    String parenthesis,
    String expression,
    bool toggle,
    bool isFinished,
    String answer,
  }) {
    _model = _model.copyWith(
      result: result,
      parenthesis: parenthesis,
      expression: expression,
      toggle: toggle,
      isFinished: isFinished,
      answer: answer,
    );

    _modelController.add(_model);
  }

  void clearDisplay() {
    updateWith(
      toggle: false,
      isFinished: false,
      answer: "",
    );
  }

  void toggleFunction() {
    if (_model.result == "") {
      if (_model.toggle == true) {
        updateWith(
          toggle: false,
          parenthesis: ")",
        );
      } else {
        updateWith(
          toggle: true,
          parenthesis: "(",
        );
      }
    }
  }

  void clearResult() {
    updateWith(
      result: "",
    );
  }

  void buttonPress(String buttonString) {
    print(buttonString);

    //  m.buttonPress(buttonString);
    if (buttonString == "C") {
      clearResult();

      clearDisplay();
    } else if (buttonString == "<-") {
      if (_model.result.substring(_model.result.length - 1) == "(" ||
          _model.result.substring(_model.result.length - 1) == ")") {
        if (_model.parenthesis == "(") {
          updateWith(toggle: false);
        } else if (_model.parenthesis == ")") {
          updateWith(toggle: true);
        }
      } else {
        print("Nothing");
      }
      print(_model.parenthesis);
      updateWith(
        result: _model.result.substring(0, _model.result.length - 1),
      );

      if (_model.answer != "") {
        clearResult();
      } else {}

      if (_model.result == "") {
        clearResult();
      }
    } else if (buttonString == "=") {
      updateWith(
        expression: _model.result,
      );

      print("Expression: ${_model.expression}");

      updateWith(
        expression: _model.expression.replaceAll("x", "*"),
      );
      updateWith(
        expression: _model.expression.replaceAll("÷", "/"),
      );

      print("Expression2: ${_model.expression}");

      try {
        Parser parser = Parser();
        Expression exp = parser.parse(_model.expression);

        ContextModel cm = ContextModel();
        // result = exp.evaluate(EvaluationType.REAL, cm).toString();
        updateWith(
          answer: "${(exp.evaluate(EvaluationType.REAL, cm))}",
        );
        updateWith(
            result: _model.answer == "Infinity" ? "Math Error" : _model.answer);

        //result = answer;
        print(_model.answer);
      } catch (e) {
        print(e);
        // result = "Error";
        updateWith(
          result: e.toString().contains("RangeError (index)")
              ? "Syntax Error"
              : "Error",
        );
      }
      updateWith(
        toggle: false,
        isFinished: true,
      );
    } else if (buttonString == "0") {
      updateWith(
        result: _model.result.contains("Error")
            ? "0"
            : _model.result + buttonString,
      );
    } else {
      if (buttonString == "()") {
        if (_model.toggle == null) {
          updateWith(toggle: false);
        } else if (_model.toggle != null) {
          if (_model.toggle == false) {
            updateWith(
              parenthesis: "(",
              toggle: true,
            );

            buttonString = _model.parenthesis;
          } else {
            updateWith(
              parenthesis: ")",
              toggle: false,
            );
            buttonString = _model.parenthesis;
          }
        }
        updateWith(
          result: _model.result == "0"
              ? buttonString
              : _model.result + buttonString,
        );
      } else if (_model.result == "0") {
        updateWith(result: buttonString);
      } else {
        if (_model.result.contains("Error")) {
          updateWith(result: buttonString);
        } else if (_model.result != "" && _model.isFinished == true) {
          updateWith(result: buttonString);

          clearDisplay();
        } else {
          updateWith(
            result: _model.result + buttonString,
          );
        }
        // result = result + buttonString;

      }
    }
  }
}

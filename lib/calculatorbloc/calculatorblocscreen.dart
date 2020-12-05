import 'package:Calculator/2/resultDisplay.dart';
import 'package:Calculator/2/widgets.dart';
import 'package:Calculator/calculatorbloc/calculatorbloc.dart';
import 'package:Calculator/calculatorbloc/calculatormodel.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class CalculatorBlocScreen extends StatefulWidget {
  CalculatorBlocScreen({@required this.bloc});
  final CalculatorBlocTest bloc;

  static Widget create(BuildContext context) {
    return Provider<CalculatorBlocTest>(
      create: (_) => CalculatorBlocTest(),
      child: Consumer<CalculatorBlocTest>(
        builder: (_, bloc, __) => CalculatorBlocScreen(
          bloc: bloc,
        ),
      ),
      dispose: (_, bloc) => bloc.dispose(),
    );
  }

  @override
  _CalculatorBlocScreenState createState() => _CalculatorBlocScreenState();
}

class _CalculatorBlocScreenState extends State<CalculatorBlocScreen> {
 
  Widget _buildContent(CalculatorModel model) {
    return Column(
      children: [
        ResultDisplay(model.result),
        Row(
          children: [
            Button("C", widget.bloc.buttonPress),
            Button("()", widget.bloc.buttonPress),
            Button("<-", widget.bloc.buttonPress),
            Button("÷", widget.bloc.buttonPress),
          ],
        ),
        Row(
          children: [
            Button("7", widget.bloc.buttonPress),
            Button("8", widget.bloc.buttonPress),
            Button("9", widget.bloc.buttonPress),
            Button("x", widget.bloc.buttonPress),
          ],
        ),
        Row(
          children: [
            Button("4", widget.bloc.buttonPress),
            Button("5", widget.bloc.buttonPress),
            Button("6", widget.bloc.buttonPress),
            Button("-", widget.bloc.buttonPress),
          ],
        ),
        Row(
          children: [
            Button("1", widget.bloc.buttonPress),
            Button("2", widget.bloc.buttonPress),
            Button("3", widget.bloc.buttonPress),
            Button("+", widget.bloc.buttonPress),
          ],
        ),
        Row(
          children: [
            Button("00", widget.bloc.buttonPress),
            Button("0", widget.bloc.buttonPress),
            Button(".", widget.bloc.buttonPress),
            Button("=", widget.bloc.buttonPress),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CalculatorModel>(
      stream: widget.bloc.modelStream,
      initialData: CalculatorModel(),
      builder: (context, snapshot) {
        final CalculatorModel model = snapshot.data;
        return Scaffold(
          backgroundColor: Colors.indigo[900],
          body: _buildContent(model),
        );
      },
    );
  }
}

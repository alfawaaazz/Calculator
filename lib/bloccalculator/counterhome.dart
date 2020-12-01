import 'package:Calculator/bloccalculator/counterbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, int>(
              builder: (BuildContext context, int state) {
                return Text(
                  "Counter Value: $state",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    _counterBloc.add(CounterEvents.increment);
                  },
                  child: Text("Increment"),
                ),
                RaisedButton(
                  onPressed: () {
                    _counterBloc.add(CounterEvents.decrement);
                  },
                  child: Text("Decrement"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

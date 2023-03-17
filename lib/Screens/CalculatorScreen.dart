import 'package:flutter/material.dart';
import 'package:flutter_calculator/CalculatorAppState.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<CalculatorAppState>();
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  color: Colors.greenAccent,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          appState.input,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                const NumberButtonRow(list: [4, 5, 6]),
                const NumberButtonRow(list: [4, 5, 6]),
                const NumberButtonRow(list: [1, 2, 3])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  NumberButton({super.key, required this.number}) {
    title = number.toString();
  }

  final int number;
  late final String title;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<CalculatorAppState>();
    return ElevatedButton(
      onPressed: () {
        appState.appendNumber(newInput: title);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(30),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}

class NumberButtonRow extends StatelessWidget {
  final List<int> list;

  const NumberButtonRow({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            NumberButton(number: list[0]),
            const SizedBox(width: 15),
            NumberButton(number: list[1]),
            const SizedBox(width: 15),
            NumberButton(number: list[2]),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
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

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
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
              const NumberButtonRow(
                  list: [7, 8, 9], type: SpecialButtonType.multiplication),
              const NumberButtonRow(
                  list: [4, 5, 6], type: SpecialButtonType.subtraction),
              const NumberButtonRow(
                  list: [1, 2, 3], type: SpecialButtonType.sum),
              const SpecialButtonRow()
            ],
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
        padding: const EdgeInsets.all(22),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}

class SpecialButton extends StatelessWidget {
  SpecialButton({super.key, required this.type}) {
    if (type == SpecialButtonType.multiplication) {
      icon = CupertinoIcons.multiply;
    } else if (type == SpecialButtonType.subtraction) {
      icon = Icons.remove;
    } else if (type == SpecialButtonType.sum) {
      icon = Icons.add;
    } else if (type == SpecialButtonType.clear) {
      icon = CupertinoIcons.arrow_counterclockwise;
    } else if (type == SpecialButtonType.comma) {
      icon = Icons.accessibility_sharp;
    } else {
      icon = CupertinoIcons.equal;
    }
  }

  final SpecialButtonType type;
  late final IconData icon;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<CalculatorAppState>();
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(22),
      ),
      child: Icon(
        icon,
        size: 22,
      ),
    );
  }
}

class NumberButtonRow extends StatelessWidget {
  final List<int> list;
  final SpecialButtonType type;

  const NumberButtonRow({super.key, required this.list, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberButton(number: list[0]),
          const SizedBox(width: 22),
          NumberButton(number: list[1]),
          const SizedBox(width: 22),
          NumberButton(number: list[2]),
          const SizedBox(width: 22),
          SpecialButton(
            type: type,
          ),
        ],
      ),
    );
  }
}

class SpecialButtonRow extends StatelessWidget {
  const SpecialButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpecialButton(type: SpecialButtonType.clear),
          const SizedBox(width: 22),
          NumberButton(number: 0),
          const SizedBox(width: 22),
          SpecialButton(type: SpecialButtonType.comma),
          const SizedBox(width: 22),
          SpecialButton(type: SpecialButtonType.equals),
        ],
      ),
    );
  }
}

enum SpecialButtonType {
  multiplication,
  subtraction,
  sum,
  clear,
  comma,
  equals
}

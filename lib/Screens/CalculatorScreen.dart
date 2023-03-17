import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(color: colorScheme.surfaceVariant);

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
                  color: Colors.amber,
                  child: Row(
                    children: [
                      NumberButton(number: 7),
                      const SizedBox(width: 15),
                      NumberButton(number: 8),
                      const SizedBox(width: 15),
                      NumberButton(number: 9),
                    ],
                  ),
                ),
                Container(
                  color: Colors.amber,
                  child: Row(
                    children: [
                      NumberButton(number: 4),
                      const SizedBox(width: 15),
                      NumberButton(number: 5),
                      const SizedBox(width: 15),
                      NumberButton(number: 6),
                    ],
                  ),
                ),
                Container(
                  color: Colors.amber,
                  child: Row(
                    children: [
                      NumberButton(number: 1),
                      const SizedBox(width: 15),
                      NumberButton(number: 2),
                      const SizedBox(width: 15),
                      NumberButton(number: 3),
                    ],
                  ),
                )
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
    return ElevatedButton(
      onPressed: () {
        print("Pressed $title");
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

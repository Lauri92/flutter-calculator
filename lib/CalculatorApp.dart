import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CalculatorAppState.dart';
import 'Screens/CalculatorScreen.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorAppState(),
      child: MaterialApp(
        title: 'Calculator app',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        ),
        home: const CalculatorScreen(),
      ),
    );
  }
}

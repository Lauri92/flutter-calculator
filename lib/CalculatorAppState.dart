import 'package:flutter/cupertino.dart';

class CalculatorAppState extends ChangeNotifier {

  var input = "";

  appendNumber({required String newInput}) {
    input += newInput;
    notifyListeners();
  }

}
import 'package:flutter/cupertino.dart';

class CalculatorAppState extends ChangeNotifier {
  var operation = "";
  var last = "";

  provideInput({required String newInput}) {
    if (operation.length <= 24 && last != "x") {
      operation += newInput;
      last = operation[operation.length - 1];
      notifyListeners();
    } else if (operation.isEmpty) {
      operation = newInput;
      last = newInput;
      notifyListeners();
    }
  }

  removeLast() {
    if (operation.isNotEmpty) {
      operation = operation.substring(0, operation.length - 1);
      if (operation.length > 2) {
        last = operation[operation.length - 1];
      } else {
        last = "";
      }
      notifyListeners();
    }
  }

  clearAll() {
    operation = "";
    last = "";
    notifyListeners();
  }
}

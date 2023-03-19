import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

class CalculatorAppState extends ChangeNotifier {
  var operation = "";
  var last = "";
  var calculationResult = 0;

  provideInput({required String newInput}) {
    if (shouldAllowInput(newInput)) {
      if (operation.length <= 24) {
        operation += newInput;
        last = operation[operation.length - 1];
        _performCalculation();
        notifyListeners();
      } else if (operation.isEmpty) {
        operation = newInput;
        last = newInput;
        notifyListeners();
      } else {
        print("Too long operation");
      }
    } else {
      print("Didn't pass");
    }
  }

  removeLast() {
    if (operation.isNotEmpty) {
      operation = operation.substring(0, operation.length - 1);
      if (operation.length > 1) {
        last = operation[operation.length - 1];
      } else if (operation.length == 1) {
        last = last = operation[0];
      } else {
        last = "";
      }
      _performCalculation();
      notifyListeners();
    }
  }

  clearAll() {
    operation = "";
    last = "";
    notifyListeners();
  }

  bool shouldAllowInput(String a) {
    if (operation.isEmpty && (a == "*" || a == "-" || a == "+")) {
      return false;
    }
    if (a == "*" && (last == "*" || last == "-" || last == "+")) {
      return false;
    } else if (a == "-" && (last == "*" || last == "-" || last == "+")) {
      return false;
    } else if (a == "+" && (last == "*" || last == "-" || last == "+")) {
      return false;
    } else {
      return true;
    }
  }

  _performCalculation() {
    List<String> calculationElements = [];
    List<String> operatorElements = [];

    String appendableElement = "";

    for (var element in operation.codeUnits) {
      String stringElement = String.fromCharCode(element);
      if (stringElement != "*" &&
          stringElement != "-" &&
          stringElement != "+") {
        appendableElement += stringElement;
      } else {
        calculationElements.add(appendableElement);
        calculationElements.add(stringElement);
        operatorElements.add(stringElement);
        appendableElement = "";
      }
    }

    if (last != "*" && last != "-" && last != "+") {
      calculationElements.add(last);
    }

    //print("calculation elements: $calculationElements");
    //print("operator elements: $operatorElements");

    var list = ["1", "+", "2", "+", "3", "+", "4", "*", "5", "*", "6"];
    var operatorList = ["+", "+", "+", "*", "*"];

    String? currentOperator;
    int currentOperatorStreak = 0;
    int indexCalculatedTracker = 0;

    var total = 0;

    for (int i = 0; i < operatorList.length; i++) {
      if (currentOperator != operatorList[i]) {
        // Null check to not attempt to calculate total when assigning first operator value
        if (currentOperator != null) {
          if (currentOperator == "+") {
            print("Handle SUM");
            for (int j = 0; j < currentOperatorStreak; j++) {
              print(
                  "Index in SUM inner for loop: $j, element to be added to total: ${list[indexCalculatedTracker * 2]}");
              total += int.parse(list[indexCalculatedTracker * 2]);
              indexCalculatedTracker++;
            }
          } else if (currentOperator == "*") {
            print("Handle multiplication");
            print(
                "Current operator streak in multiplication: $currentOperatorStreak");
            int product = 1;
            for (int j = 0; j <= currentOperatorStreak; j++) {
              print(
                  "Index in MULTIPLCIATION for loop: $j, element to be multiplied with other elements in the array, product to be added to total: ${list[indexCalculatedTracker * 2]}");
              product *= int.parse(list[indexCalculatedTracker * 2]);
              indexCalculatedTracker++;
            }
            print("Prodcut after multiplocation for loop: $product");
            total += product;
          }
        }
        currentOperatorStreak = 0;
        currentOperator = operatorList[i];
        currentOperatorStreak++;
      } else {
        currentOperatorStreak++;
      }
      print(
          "Current operator is: $currentOperator, Streak is $currentOperatorStreak, Current index $i");

      if (i == operatorList.length - 1) {
        print("Do something on last iteration");
        if (currentOperator == "+") {
          print("Handle LAST sum");
          for (int j = 0; j < currentOperatorStreak; j++) {
            print(
                "Index in SUM inner for loop: $j, element to be added to total: ${list[indexCalculatedTracker * 2]}");
            total += int.parse(list[indexCalculatedTracker * 2]);
            indexCalculatedTracker++;
          }
        } else if (currentOperator == "*") {
          print("Handle LAST multiplication");
          print(
              "Current operator streak in multiplication: $currentOperatorStreak");
          int product = 1;
          for (int j = 0; j <= currentOperatorStreak; j++) {
            print(
                "Index in MULTIPLCIATION for loop: $j, element to be multiplied with other elements in the array, product to be added to total: ${list[indexCalculatedTracker * 2]}");
            product *= int.parse(list[indexCalculatedTracker * 2]);
            indexCalculatedTracker++;
          }
          print("Prodcut after multiplocation for loop: $product");
          total += product;
        }
      }
      print("Total is $total");

      // region Try from single list
      /*
    for (int i = 0; i < list.length; i++) {
      bool isOperator = checkOperator(list[i]);
      //print('${list[i]} is at index $i');
      if (isOperator) {
        currentOperator = list[i];
        var previousNumber = int.parse(list[i - 1]);
        var nextNumber = int.parse(list[i + 1]);
        var previousOperator;
        var nextOperator;
        bool startOfExpression = false;

        if (list.length > i + 2) {
          nextOperator = list[i + 2];
        }

        if (i == 1) {
          startOfExpression = true;
        }

        if (i - 2 >= 0) {
          previousOperator = list[i - 2];
        }

        print("Total is $total");
      }
    }

 */
      // endregion
    }
  }

  bool checkOperator(String a) {
    if (a == "+") {
      return true;
    } else if (a == "-") {
      return true;
    } else if (a == "*") {
      return true;
    } else {
      return false;
    }
  }
}

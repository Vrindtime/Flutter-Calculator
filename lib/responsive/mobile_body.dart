import 'package:calculator/common/numberBtn.dart';
import 'package:calculator/common/symbolBtn.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

// ignore: must_be_immutable
class mobileBody extends StatelessWidget {
  TextEditingController displayController = TextEditingController();

  late var displaySymbol;

  double size = 80;
  double padd = 9.0;

  List<String> temp = [];

  bool _isBool(String value) {
    List<String> operators = ["+", "-", "*", "/", "%"];
    return operators.contains(value);
  }

  void _math() {
    try {
      // Create a Parser instance
      Parser parser = Parser();
      // Define a mathematical expression
      String expressionStr = temp.join();
      try {
        // Parse the expression
        Expression expression = parser.parse(expressionStr);

        // Evaluate the expression
        double result = expression.evaluate(EvaluationType.REAL, ContextModel());

        // Print the result
        displayController.text = result.toString();
        temp.clear();

        temp.add(result.toString());
        updateDisplay();
      } catch (e) {
        // Handle any parsing or evaluation errors
      }
    } on Exception {
      displayController.text = "Error:";
    }
  }

  updateDisplay() {
    // Update the display with the current input
    displayController.text = temp.join();
  }

  mobileBody({Key ? key}) {
    displaySymbol = (String value) {
      // temp+=value;
      if (value == "AC") {
        //need to clear the list
        displayController.text = "";
        temp.clear();
      } else if (value == "B") {
        //need to reduce a char for the array
        if (temp.isNotEmpty) {
          temp.removeLast();
        }
        updateDisplay();
      } else if (value == "=") {
        _math();
      } else {
        //to auto math when an operator is clikced +,-,*,/,%
        if (_isBool(value)) {
          _math();
        }
        // Add numbers and operators to the list
        temp.add(value);
        updateDisplay();
        
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            "Basic Calculator",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                Icons.light_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: TextField(
              controller: displayController,
              readOnly: true,
              keyboardType: null,
              decoration: const InputDecoration(border: InputBorder.none),
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: symbolBtn(symbol: "AC", display: displaySymbol),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: symbolBtn(symbol: "B", display: displaySymbol),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: symbolBtn(symbol: "/", display: displaySymbol),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: symbolBtn(symbol: "*", display: displaySymbol),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: NumBtn(
                    num: "7",
                    display: displaySymbol,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: NumBtn(
                    num: "8",
                    display: displaySymbol,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: NumBtn(
                    num: "9",
                    display: displaySymbol,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: symbolBtn(symbol: "-", display: displaySymbol),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: NumBtn(
                    num: "4",
                    display: displaySymbol,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: NumBtn(
                    num: "5",
                    display: displaySymbol,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: NumBtn(
                    num: "6",
                    display: displaySymbol,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: symbolBtn(symbol: "+", display: displaySymbol),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: NumBtn(
                    num: "1",
                    display: displaySymbol,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: NumBtn(
                    num: "2",
                    display: displaySymbol,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: NumBtn(
                    num: "3",
                    display: displaySymbol,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: symbolBtn(symbol: "%", display: displaySymbol),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: 275,
                  child: NumBtn(
                    num: "0",
                    display: displaySymbol,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padd),
                child: SizedBox(
                  height: size,
                  width: size,
                  child: symbolBtn(symbol: "=", display: displaySymbol),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:calculatrice/data/buttons_data.dart';
import 'package:calculatrice/widgets/button_grid.dart';
import 'package:calculatrice/widgets/writtable_area.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  var computingText = '';
  var resultsText = '';

  @override
  Widget build(BuildContext context) {
    Color? textColor;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: WrittableArea(
                  computingText: computingText,
                  textColor: textColor,
                  resultsText: resultsText),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                child: ButtonGrid(
                    computeText: computeText,
                    resultsText: resultsText,
                    computingText: computingText)),
          ),
        ],
      ),
    );
  }

  void computeText({required int index}) {
    setState(() {
      if (buttons[index] == 'undo') {
        computingText = '';
        resultsText = '';
      } else if (buttons[index] == 'plus_minus') {
      } else if (buttons[index] == 'X' ||
          buttons[index] == '-' ||
          buttons[index] == '+') {
        if (resultsText.isNotEmpty) {
          computingText = resultsText + buttons[index];
          resultsText = '';
        } else {
          computingText += buttons[index];
        }
      } else if (buttons[index] == 'C') {
        if (computingText.isEmpty) {
        } else {
          computingText = computingText.substring(0, computingText.length - 1);
        }
      } else if (buttons[index] == '=') {
        equalPressed();
      } else if (buttons[index] == 'diviser') {
        if (resultsText.isNotEmpty) {
          computingText = resultsText + '/';
          resultsText = '';
        } else {
          computingText += '/';
        }
      } else {
        computingText += buttons[index];
      }
    });
  }

  void equalPressed() {
    final finalComputing = computingText;
    var finalComputingText = finalComputing.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalComputingText);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    resultsText = eval.toString();
  }
}

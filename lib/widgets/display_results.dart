import 'package:calculatrice/providers/theme_provider.dart';
import 'package:calculatrice/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:math_expressions/math_expressions.dart';

class DisplayNumber extends StatefulWidget {
  const DisplayNumber({Key? key}) : super(key: key);

  @override
  _DisplayNumberState createState() => _DisplayNumberState();
}

class _DisplayNumberState extends State<DisplayNumber> {
  var computingText = '';
  var resultsText = '';
  final List<dynamic> buttons = [
    'C',
    'plus_minus',
    '%',
    'diviser',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    'undo',
    '0',
    '.',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    Color? textColor;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      computingText,
                      style: TextStyle(color: textColor, fontSize: 30),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      resultsText,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 2.2),
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return MyButton(
                        function: () {
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
                                computingText = computingText.substring(
                                    0, computingText.length - 1);
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
                        },
                        color: (themeProvider.isDarkMode)
                            ? const Color(0xFF282b33)
                            : const Color(0xFFf7f7f7),
                        text: buttons[index],
                        textColor: chooseColor(
                            themeProvider.isDarkMode, buttons[index]),
                        isIcon: isIcon(buttons[index]));
                  }),
            ),
          ),
        ],
      ),
    );
  }

  bool isIcon(String x) {
    if (x == 'plus_minus' || x == 'diviser' || x == 'undo') {
      return true;
    } else {
      return false;
    }
  }

  Color chooseColor(bool x, String y) {
    if (y == 'plus_minus' || y == 'C' || y == '%') {
      return const Color(0xFF9ae3d6);
    } else if (y == 'diviser' || y == 'X' || y == '-' || y == '+' || y == '=') {
      return const Color(0xFFcc6e6f);
    } else if (x) {
      return const Color(0xFFf4f8fa);
    } else {
      return const Color(0xFF35383e);
    }
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

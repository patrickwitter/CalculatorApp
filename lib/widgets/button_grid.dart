// ignore_for_file: must_be_immutable

import 'package:calculatrice/data/buttons_data.dart';
import 'package:calculatrice/providers/theme_provider.dart';
import 'package:calculatrice/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonGrid extends StatelessWidget {
  ButtonGrid({
    required this.computeText,
    required this.resultsText,
    required this.computingText,
    Key? key,
  }) : super(key: key);

  final String computingText;
  String resultsText;

  final Function({required int index}) computeText;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return GridView.builder(
      itemCount: buttons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 2.2),
        crossAxisCount: 4,
      ),
      itemBuilder: (context, index) {
        return MyButton(
            function: () => computeText(index: index),
            color: (themeProvider.isDarkMode)
                ? const Color(0xFF282b33)
                : const Color(0xFFf7f7f7),
            text: buttons[index],
            textColor: chooseColor(themeProvider.isDarkMode, buttons[index]),
            isIcon: isIcon(buttons[index]));
      },
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
}

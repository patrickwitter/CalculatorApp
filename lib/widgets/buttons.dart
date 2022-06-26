import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.color,
    required this.text,
    required this.textColor,
    required this.isIcon,
    required this.function,
  }) : super(key: key);

  final Color color;
  final String text;
  final Color textColor;
  final bool isIcon;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: color,
              child: Center(
                  child: isIcon
                      ? SizedBox(
                          height: 28,
                          child: Image.asset(
                            'assets/$text.png',
                            color: textColor,
                          ),
                        )
                      : Text(
                          text,
                          style: themeData.textTheme.button!
                              .copyWith(color: textColor),
                        )),
            )),
      ),
    );
  }
}

import 'package:calculatrice/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModeSwitch extends StatefulWidget {
  const ModeSwitch({Key? key}) : super(key: key);

  @override
  _ModeSwitchState createState() => _ModeSwitchState();
}

class _ModeSwitchState extends State<ModeSwitch> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isSelected = themeProvider.isDarkMode;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
              color: (themeProvider.isDarkMode)
                  ? const Color(0xFF2a2d37)
                  : const Color(0xFFf9f9f9),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  themeProvider.toogleTheme(isOn: true);
                },
                child: SizedBox(
                  height: 30,
                  child: Image.asset(
                    'assets/bright.png',
                    color: isSelected ? Colors.grey : const Color(0xFF0F1828),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  themeProvider.toogleTheme(isOn: false);
                },
                child: SizedBox(
                  height: 25,
                  child: Image.asset(
                    'assets/sleep-mode.png',
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

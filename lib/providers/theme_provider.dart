import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => ThemeMode.dark == themeMode;

  void toogleTheme({required bool isOn}) {
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    backgroundColor: const Color(0xFFFFFFFF),
    primaryColor: const Color(0xFFbdbec0),
    accentColor: const Color(0xFFbdbec0),
    textTheme: const TextTheme(
      headline2: TextStyle(
        color: Color(0xFF060709),
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      bodyText1: TextStyle(
        color: Color(0xFF060709),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF5d5f63),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF22252d),
    backgroundColor: const Color(0xFFFFFFFF),
    primaryColor: const Color(0xFFbdbec0),
    accentColor: const Color(0xFFbdbec0),
    fontFamily: 'Mulish',
    textTheme: const TextTheme(
      headline2: TextStyle(
        color: Color(0xFFF7F7FC),
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      bodyText1: TextStyle(
        color: Color(0xFFF7F7FC),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: TextStyle(
        color: Color(0xFFbdbec0),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

// ignore_for_file: file_names

import 'package:calculatrice/providers/theme_provider.dart';
import 'package:calculatrice/widgets/display.dart';
import 'package:calculatrice/widgets/thememode_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: const [
              ModeSwitch(),
              Display(),
            ],
          ),
        ),
      ),
    );
  }
}

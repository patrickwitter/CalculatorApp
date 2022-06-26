import 'package:calculatrice/providers/theme_provider.dart';
import 'package:calculatrice/widgets/display_results.dart';
import 'package:calculatrice/widgets/mode_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
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
              DisplayNumber(),
            ],
          ),
        ),
      ),
    );
  }
}

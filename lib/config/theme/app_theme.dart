import 'package:flutter/material.dart';

class AppTheme {
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false});

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: Colors.white,
    );
  }
}

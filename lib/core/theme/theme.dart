import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  // useMaterial3: false,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade200,
    primary: Colors.blue,
    secondary: Colors.grey.shade200,
    onBackground: Colors.black,
  ),
  appBarTheme:
      const AppBarTheme(color: Colors.blue, foregroundColor: Colors.white),
  splashColor: Colors.white,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  // useMaterial3: false,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.blue.shade600,
    secondary: Colors.grey.shade700,
    onBackground: Colors.white,
  ),
  appBarTheme:
      const AppBarTheme(color: Colors.black, foregroundColor: Colors.white),
  splashColor: Colors.black,
);

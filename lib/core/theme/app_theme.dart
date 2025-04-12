import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF287291),
          onPrimary: Colors.white,
          secondary: Colors.black,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xFF287291),
          onSurface: Colors.white),
      textTheme: TextTheme());
}

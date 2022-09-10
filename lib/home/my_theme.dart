import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121312),
      ),
      scaffoldBackgroundColor: Color(0xFF121312),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.white, fontSize: 20),
        bodySmall: TextStyle(color: Color(0xFFB5B4B4), fontSize: 12),
      ));
}
